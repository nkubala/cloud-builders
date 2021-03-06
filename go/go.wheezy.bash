#!/bin/bash
#
# Copyright 2016 Google, Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
. /builder/prepare_workspace.inc
prepare_workspace || exit


cat << EOF
*******************************************************************************
*** NOTICE: The 'go:wheezy' builder is deprecated. Use 'go:debian' instead. ***
*** Starting no earlier than December 12, 2017, this builder will be broken ***
*** and will no longer work.                                                ***
*******************************************************************************
EOF

if [[ "$1" == install ]]; then
  # Give a hint about where binaries end up if we think they're using 'go install'.
  gp=$(go env GOPATH)
  binpath=${gp#$PWD/}/bin
  echo "Binaries built using 'go install' will go to \"$binpath\"."
fi
echo "Running: go $@"
go "$@"
