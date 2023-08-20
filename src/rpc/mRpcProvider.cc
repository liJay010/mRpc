#include "mRpcProvider.h"
#include "mRpcConfig.h"
#include "zookeeperutil.h"
#include "Logger.h"
#include "rpcheader.pb.h"
void mRpcProvider::NotifyService(google::protobuf::Service *service)
{
    //此方法用来保存其对应的服务和方法
    //先获取服务
    ServiceInfo service_info;
    const  google::protobuf::ServiceDescriptor * service_des = service->GetDescriptor();
    std::string service_name  = service_des->name();
    int  methodCnt  = service_des->method_count();

    LOG_INFO("service_name:%s", service_name.c_str());

    for(int i = 0; i < methodCnt; i++)
    {
        const google::protobuf::MethodDescriptor* pmethodDesc = service_des->method(i);
        std::string method_name = pmethodDesc->name();
        service_info.m_methodMap.insert({method_name,pmethodDesc});
        LOG_INFO("method_name:%s", method_name.c_str());
    }
    service_info.m_service = service;
    m_serviceMap.insert({service_name,service_info});

}
void mRpcProvider::Run()
{
    //创建TcpServer
    std::string ip = mRpcConfig::instance().Load("rpcserverip");
    uint16_t port =stoi(mRpcConfig::instance().Load("rpcserverport"));
    InetAddress address(port, ip);
    TcpServer server(&loop,address,"mRpcSever");
    server.setConnectionCallback(std::bind(&mRpcProvider::onConnetion,this,std::placeholders::_1));
    server.setMessageCallback(std::bind(&mRpcProvider::onMessage,this,std::placeholders::_1,std::placeholders::_2,std::placeholders::_3));
    server.setThreadNum(4);

    //注册相应的zk服务
    ZkClient zk;
    zk.Start();
    //Create(const char *path, const char *data, int datalen, int state=0);

    for(auto m_service:m_serviceMap)
    {
        std::string service_path = "/" + m_service.first;

        zk.Create(service_path.c_str(), nullptr, 0);
        for(auto &mp : m_service.second.m_methodMap)
        {
            std::string method_path = service_path + "/" + mp.first;
            char method_path_data[128] = {0};
            sprintf(method_path_data,"%s:%d",ip.c_str(), port);
            zk.Create(method_path.c_str(), method_path_data, strlen(method_path_data),ZOO_EPHEMERAL);
        }
    }

    // rpc服务端准备启动，打印信息
    LOG_INFO("RpcProvider start service at ip:%s port:%d", ip.c_str(), port);
    server.start();
    loop.loop();
}


void mRpcProvider::onConnetion(const TcpConnectionPtr& conn)
{
    if(!conn->connected())
    {
        conn->shutdown();
    }
}

void mRpcProvider::onMessage(const TcpConnectionPtr& conn,Buffer* buffer, Timestamp)
{
    //对客户端发送过来的 Tcp包进行解包
    std::string recv_buf  = buffer->retrieveAllAsString();
    u_int32_t header_size = 0; //在这里面包含数据长度

    recv_buf.copy((char*)&header_size,4,0);

    std::string rpc_header_str = recv_buf.substr(4, header_size);
    fixbug::RpcHeader header;
    
    std::string service_name;
    std::string method_name;
    uint32_t args_size;
    if(header.ParseFromString(rpc_header_str))
    {
        service_name = header.servicename();
        method_name = header.methodname();
        args_size = header.arglen();
    }
    else
    {
        // 数据头反序列化失败
        LOG_ERROR("rpc_header_str:%s parse error!", rpc_header_str.c_str());
        return;
    }

    // 获取rpc方法参数的字符流数据
    std::string args_str = recv_buf.substr(4 + header_size, args_size);
    // 打印调试信息
    LOG_DEBUG( "============================================");
    LOG_DEBUG( "header_size: %d" , header_size);
    LOG_DEBUG( "header_size: %s" , rpc_header_str.c_str());
    LOG_DEBUG( "header_size: %s" , service_name.c_str());
    LOG_DEBUG( "header_size: %s" , method_name.c_str());
    LOG_DEBUG( "header_size: %s" , args_str.c_str());
    LOG_DEBUG( "============================================");

    // 获取service对象和method对象
    auto service_it = m_serviceMap.find(service_name);
    if(service_it == m_serviceMap.end())
    {
        LOG_ERROR( "%s is not exist!" , service_name.c_str());
        return;
    }
    auto method_it = service_it->second.m_methodMap.find(method_name);
    if(method_it == service_it->second.m_methodMap.end())
    {
        LOG_ERROR( "%s is not exist!" , method_name.c_str());
        return;
    }
    google::protobuf::Service *service = service_it->second.m_service; // 获取service对象  new UserService
    const  google::protobuf::MethodDescriptor *method = method_it->second; // 获取method对象

    // 生成rpc方法调用的请求request和响应response参数
    google::protobuf::Message *request = service->GetRequestPrototype(method).New();
    if (!request->ParseFromString(args_str))
    {
        LOG_ERROR("request parse error, content:%s" , args_str.c_str());
        return;
    }
    google::protobuf::Message *response = service->GetResponsePrototype(method).New();

    // 给下面的method方法的调用，绑定一个Closure的回调函数
    google::protobuf::Closure *done = google::protobuf::NewCallback<mRpcProvider, 
                                                                    const TcpConnectionPtr&, 
                                                                    google::protobuf::Message*>
                                                                    (this, 
                                                                    &mRpcProvider::SendRpcResponse, 
                                                                    conn, response);
    service->CallMethod(method, nullptr,request, response, done);

}

// Closure的回调操作，用于序列化rpc的响应和网络发送
void mRpcProvider::SendRpcResponse(const TcpConnectionPtr& conn,google::protobuf::Message* response)
{
    std::string response_str;
    if (response->SerializeToString(&response_str)) // response进行序列化
    {
        // 序列化成功后，通过网络把rpc方法执行的结果发送会rpc的调用方
        conn->send(response_str);
    }
    else{
        LOG_ERROR("serialize response_str error!");
    }
    conn->shutdown();
}