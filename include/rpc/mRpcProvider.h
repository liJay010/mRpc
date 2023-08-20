#pragma once
#include "google/protobuf/service.h"
#include <google/protobuf/descriptor.h>
#include "TcpServer.h"
#include <unordered_map>

class mRpcProvider
{
public:
    void NotifyService(google::protobuf::Service *service);
    void Run();

private:
    EventLoop loop;
    struct ServiceInfo
    {
        google::protobuf::Service *m_service;
        std::unordered_map<std::string ,const google::protobuf::MethodDescriptor*> m_methodMap;
    };
    
    std::unordered_map<std::string , ServiceInfo> m_serviceMap;

    void onConnetion(const TcpConnectionPtr& conn);

    void onMessage(const TcpConnectionPtr& conn,Buffer* buffer, Timestamp);

    // Closure的回调操作，用于序列化rpc的响应和网络发送
    void SendRpcResponse(const TcpConnectionPtr& conn,google::protobuf::Message*);
};
