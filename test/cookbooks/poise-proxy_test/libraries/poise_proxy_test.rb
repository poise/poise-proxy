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

class Chef
  class Resource::PoiseProxyTest < Resource
    include Poise
    actions(:enable)

    attribute(:path, name_attribute: true)
    attribute(:port, default: 8080)
  end

  class Provider::PoiseProxyTest < Provider
    include Poise

    def action_enable
      notifying_block do
        include_recipe 'runit'
        directory new_resource.path do
          owner 'root'
          group 'root'
          mode '755'
        end

        file ::File.join(new_resource.path, 'index.html') do
          owner 'root'
          group 'root'
          mode '644'
          content 'I am a teapot.'
        end

        runit_service 'poise-proxy-test' do
          action :enable
          options path: new_resource.path, port: new_resource.port
        end
      end
    end
  end
end
