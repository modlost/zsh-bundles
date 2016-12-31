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

function docker-clean-containers {
  docker ps -a -q | while read containers; do
    docker rm -f $containers
  done
}

function docker-clean-nones {
  docker images | grep '^<none>' | awk '{print $3}' | while read none; do
    docker rmi -f $none
  done
}

function docker-clean-all {
  docker-clean-containers
  docker-clean-nones
}

compctl -K docker-clean-all docker-clean-containers docker-clean-nones
