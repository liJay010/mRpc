#include <iostream>
#include "mRpcConfig.h"
#include <string>
#include "useservice.pb.h"
#include "mRpcChannel.h"

int main(int argc, char **argv)
{
    //加载文件
    mRpcConfig::instance().LoadConfigFile(argc,argv);
    
    fixbug::UserServiceRpc_Stub stub(new mRpcChannel());
    fixbug::LoginRequest request;
    request.set_name("zhang san");
    request.set_pwd("123456");

    fixbug::LoginResponse response;
    stub.Login(nullptr, &request, &response,nullptr);

    // 一次rpc调用完成，读调用的结果
    if (0 == response.result().errcode())
    {
        std::cout << "rpc login response success:" << response.sucess() << std::endl;
    }
    else
    {
        std::cout << "rpc login response error : " << response.result().errmsg() << std::endl;
    }

    

    return 0;
}