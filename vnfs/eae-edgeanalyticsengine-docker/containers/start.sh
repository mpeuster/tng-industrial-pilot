#!/bin/bash
#  Copyright (c) 2018 5GTANGO, Paderborn University
# ALL RIGHTS RESERVED.
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
#
# Neither the name of the SONATA-NFV, 5GTANGO, Paderborn University
# nor the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# This work has also been performed in the framework of the 5GTANGO project,
# funded by the European Commission under Grant number 761493 through
# the Horizon 2020 and 5G-PPP programmes. The authors would like to
# acknowledge the contributions of their colleagues of the SONATA
# partner consortium (www.5gtango.eu).


echo "EAE: Reconfiguring Grafana based on env vars"
python3 reconfigure_grafana.py
#set grafana password
#grafana-cli --homepath "usr/share/grafana" admin reset-admin-password tango
echo "EAE: Starting Grafana..." #this is copied from the grafana docker containers run.sh
exec grafana-server                                         \
  --homepath="/usr/share/grafana"                           \
  --config="/etc/grafana/grafana.ini"                       \
  "$@"                                                      \
  cfg:default.log.mode="console"                            \
  cfg:default.paths.data="/var/lib/grafana"                 \
  cfg:default.paths.logs="/var/logs/grafana"                \
  cfg:default.paths.plugins="/var/lib/grafana/plugins"      \
  cfg:default.paths.provisioning="/etc/grafana/provisioning"

