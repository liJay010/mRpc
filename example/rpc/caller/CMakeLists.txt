set(SRC_LIST calluserservice.cc ../useservice.pb.cc)
add_executable(rpcCaller ${SRC_LIST})
target_link_libraries(rpcCaller mrpc  mrpcNet  protobuf)