#pragma once
#include <unordered_map>
#include <string>

class mRpcConfig
{
public:
    static mRpcConfig &instance();
     // 负责解析加载配置文件
    void LoadConfigFile(int argc, char **argv);
    // 查询配置项信息
    std::string Load(const std::string &key);

private:
    mRpcConfig(){};
    mRpcConfig(const mRpcConfig &) = delete;
    const mRpcConfig & operator=(const mRpcConfig &) = delete;
    std::unordered_map<std::string, std::string> m_configMap;
    // 去掉字符串前后的空格
    void Trim(std::string &src_buf);
};