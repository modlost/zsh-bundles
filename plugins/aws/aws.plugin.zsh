#!/bin/zsh
#
# Copyright 2016 Abner Ballardo
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export AWS_HOME=~/.aws
export PATH=/usr/local/aws/bin:$PATH

if [ -n "$CONTEXT" ]; then
  export AWS_DEFAULT_PROFILE=$CONTEXT  
fi

function aws-profile-active {
  echo $AWS_DEFAULT_PROFILE
}

function aws-profile-set {
  export AWS_DEFAULT_PROFILE=$1
}

function aws-profile-list {
  grep profile ~/.aws/config | sed -e 's/\[profile \(.*\)\]/\1/g'
}

compctl -K aws-profile-active aws-profile-set aws-profile-list

completer="/usr/local/aws/bin/aws_zsh_completer.sh"
[ -x $completer ] && source $completer
