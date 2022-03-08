#!/usr/bin/env bash

# Install Buildifier.
go get github.com/bazelbuild/buildtools/buildifier

# Run Buildifier on all BUILD files in the repository.
buildifier --lint=warn \
           --mode=diff \
           --diff_command=diff \
           --warnings=all \
           -r ${GITHUB_WORKSPACE}

# If Buildifier found formatting issues, print a message that suggests how to
# fix the formatting issues. According to the `buildifier -h` output, exit code
# 1 indicates "syntax errors in input."
if [ $? -eq 1 ]; then
  echo "$1"
fi
