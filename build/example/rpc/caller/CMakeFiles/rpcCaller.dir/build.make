# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /storage4/lxj/Cplus/mRpc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /storage4/lxj/Cplus/mRpc/build

# Include any dependencies generated for this target.
include example/rpc/caller/CMakeFiles/rpcCaller.dir/depend.make

# Include the progress variables for this target.
include example/rpc/caller/CMakeFiles/rpcCaller.dir/progress.make

# Include the compile flags for this target's objects.
include example/rpc/caller/CMakeFiles/rpcCaller.dir/flags.make

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o: example/rpc/caller/CMakeFiles/rpcCaller.dir/flags.make
example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o: ../example/rpc/caller/calluserservice.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/storage4/lxj/Cplus/mRpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rpcCaller.dir/calluserservice.cc.o -c /storage4/lxj/Cplus/mRpc/example/rpc/caller/calluserservice.cc

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rpcCaller.dir/calluserservice.cc.i"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /storage4/lxj/Cplus/mRpc/example/rpc/caller/calluserservice.cc > CMakeFiles/rpcCaller.dir/calluserservice.cc.i

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rpcCaller.dir/calluserservice.cc.s"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /storage4/lxj/Cplus/mRpc/example/rpc/caller/calluserservice.cc -o CMakeFiles/rpcCaller.dir/calluserservice.cc.s

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.requires:

.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.requires

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.provides: example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.requires
	$(MAKE) -f example/rpc/caller/CMakeFiles/rpcCaller.dir/build.make example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.provides.build
.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.provides

example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.provides.build: example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o


example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o: example/rpc/caller/CMakeFiles/rpcCaller.dir/flags.make
example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o: ../example/rpc/useservice.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/storage4/lxj/Cplus/mRpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o -c /storage4/lxj/Cplus/mRpc/example/rpc/useservice.pb.cc

example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.i"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /storage4/lxj/Cplus/mRpc/example/rpc/useservice.pb.cc > CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.i

example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.s"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /storage4/lxj/Cplus/mRpc/example/rpc/useservice.pb.cc -o CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.s

example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.requires:

.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.requires

example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.provides: example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.requires
	$(MAKE) -f example/rpc/caller/CMakeFiles/rpcCaller.dir/build.make example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.provides.build
.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.provides

example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.provides.build: example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o


# Object files for target rpcCaller
rpcCaller_OBJECTS = \
"CMakeFiles/rpcCaller.dir/calluserservice.cc.o" \
"CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o"

# External object files for target rpcCaller
rpcCaller_EXTERNAL_OBJECTS =

../bin/rpcCaller: example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o
../bin/rpcCaller: example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o
../bin/rpcCaller: example/rpc/caller/CMakeFiles/rpcCaller.dir/build.make
../bin/rpcCaller: ../lib/libmrpc.so
../bin/rpcCaller: ../lib/libmrpcNet.so
../bin/rpcCaller: example/rpc/caller/CMakeFiles/rpcCaller.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/storage4/lxj/Cplus/mRpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../../bin/rpcCaller"
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rpcCaller.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/rpc/caller/CMakeFiles/rpcCaller.dir/build: ../bin/rpcCaller

.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/build

example/rpc/caller/CMakeFiles/rpcCaller.dir/requires: example/rpc/caller/CMakeFiles/rpcCaller.dir/calluserservice.cc.o.requires
example/rpc/caller/CMakeFiles/rpcCaller.dir/requires: example/rpc/caller/CMakeFiles/rpcCaller.dir/__/useservice.pb.cc.o.requires

.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/requires

example/rpc/caller/CMakeFiles/rpcCaller.dir/clean:
	cd /storage4/lxj/Cplus/mRpc/build/example/rpc/caller && $(CMAKE_COMMAND) -P CMakeFiles/rpcCaller.dir/cmake_clean.cmake
.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/clean

example/rpc/caller/CMakeFiles/rpcCaller.dir/depend:
	cd /storage4/lxj/Cplus/mRpc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /storage4/lxj/Cplus/mRpc /storage4/lxj/Cplus/mRpc/example/rpc/caller /storage4/lxj/Cplus/mRpc/build /storage4/lxj/Cplus/mRpc/build/example/rpc/caller /storage4/lxj/Cplus/mRpc/build/example/rpc/caller/CMakeFiles/rpcCaller.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/rpc/caller/CMakeFiles/rpcCaller.dir/depend
