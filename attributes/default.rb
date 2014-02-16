#
# Author:: Noah Kantrowitz <noah@coderanger.net>
#
# Copyright 2014, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['poise-proxy']['enabled'] = !!Chef::Resource::PoiseProxy.default_provider(node)
default['poise-proxy']['listen_ports'] = [80]
default['poise-proxy']['hostname'] = nil # node['fqdn']
default['poise-proxy']['ssl_enabled'] = false
default['poise-proxy']['ssl_redirect_http'] = true
default['poise-proxy']['ssl_listen_ports'] = [443]
default['poise-proxy']['ssl_path'] = nil # /etc/ssl
default['poise-proxy']['ssl_cert_path'] = nil # node['poise-proxy']['ssl_path']/name.pem
default['poise-proxy']['ssl_key_path'] = nil # node['poise-proxy']['ssl_path']/name.key
default['poise-proxy']['provider'] = nil # Auto-detects based on available cookbooks
