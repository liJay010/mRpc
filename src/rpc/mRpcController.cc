#include "mRpcController.h"

mRpcController::mRpcController()
{
    m_failed = false;
    m_errText = "";
}

void mRpcController::Reset()
{
    m_failed = false;
    m_errText = "";
}

bool mRpcController::Failed() const
{
    return m_failed;
}

std::string mRpcController::ErrorText() const
{
    return m_errText;
}

void mRpcController::SetFailed(const std::string& reason)
{
    m_failed = true;
    m_errText = reason;
}

// 目前未实现具体的功能
void mRpcController::StartCancel(){}
bool mRpcController::IsCanceled() const {return false;}
void mRpcController::NotifyOnCancel(google::protobuf::Closure* callback) {}