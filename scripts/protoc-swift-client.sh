#!/bin/sh
#
# Note that it requires protoc, protoc-gen-swift, and
# protoc-gen-grpc-swift binaries and assumes that protoc-gen-swift
# is in your PATH.
# Tested with protoc 3.19.4, protoc-gen-swift 1.18.0, and
# protoc-gen-grpc-swift 1.7.1
# Note that the script must be invoked from the root directory.

# Directory where Google protos are stored.
# Note: If this value is changed, you must update the .gitignore.
readonly google_protos_dir='googleapis'
# Directory where our generated protos are stored.
readonly generated_dir='app_SwiftUI/AggieDishApp/Generated'
# The specific commit we are using to download google protos.
readonly google_commit_name='b08e78b77ecb4ecfa26dcbd24e1a35a9651cd413'

set -e

if [ ! -d $google_protos_dir ]; then
  curl -L -O -s https://github.com/googleapis/googleapis/archive/$google_commit_name.zip
  unzip -q $google_commit_name.zip
  rm -f $google_commit_name.zip
  mv googleapis-$google_commit_name $google_protos_dir
fi

protoc \
  google/type/phone_number.proto \
  google/type/latlng.proto \
  google/type/timeofday.proto \
  protos/model/*.proto \
  protos/*.proto \
  -I . \
  -I $google_protos_dir \
  --swift_out $google_protos_dir \
  --grpc-swift_out $google_protos_dir

# Create directory, if it doesn't exist already.
mkdir -p $generated_dir

# Move Swift files to the output directory.
find $google_protos_dir \
  -name "*.swift" \
  -exec mv {} $generated_dir \;
