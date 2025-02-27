#!/bin/sh

clear

echo '### Initializing build settings...'
WORKSPACE=$HOME/work/hello/hello
OUTPUT_DIR=$HOME/work/_temp/build
echo

echo '### Cleaning output dir...'
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
echo

echo '### Checking out project source...'
mkdir -p $WORKSPACE
cp /vagrant/CMakeLists.txt $WORKSPACE
cp /vagrant/hello.cpp $WORKSPACE
echo

echo '### Listing workspace files...'
cd $WORKSPACE
ls -l
echo

echo '### Generating build files...'
cmake \
  -DCMAKE_CXX_COMPILER=g++ \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_BUILD_TYPE=Release \
  -G "Unix Makefiles" \
  -DCMAKE_C_FLAGS=-m32 \
  -DCMAKE_CXX_FLAGS=-m32 \
  -DCMAKE_C_FLAGS_RELEASE=-s \
  -DCMAKE_CXX_FLAGS_RELEASE=-s \
  -S $WORKSPACE \
  -B $OUTPUT_DIR
echo

echo '### Building...'
cmake --build $OUTPUT_DIR
echo

echo '### Checking executable binary'
file $OUTPUT_DIR/hello
echo
