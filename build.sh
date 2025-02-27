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
cp -r /vagrant/* $WORKSPACE
cd $WORKSPACE
echo

echo '### Generating build files...'
cmake \
  -DCMAKE_CXX_COMPILER=g++ \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_BUILD_TYPE=Release \
  -G "Unix Makefiles" \
  -DCMAKE_C_FLAGS=-m32 \
  -DCMAKE_CXX_FLAGS=-m32 \
  -S $WORKSPACE \
  -B $OUTPUT_DIR
echo

echo '### Building...'
cmake --build $OUTPUT_DIR
echo

echo '### Checking executable binary'
file $OUTPUT_DIR/hello
echo
