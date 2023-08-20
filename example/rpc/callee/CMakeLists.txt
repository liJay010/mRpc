set(SRC_LIST userService.cc ../useservice.pb.cc)
add_executable(rpcService ${SRC_LIST})
target_link_libraries(rpcService mrpc  mrpcNet  protobuf)