#
# Cookbook Name:: minecraft
# Recipe:: default
#
# Copyright 2013, Greg Fitzgerald
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
#

%w(bukkit.yml commands.yml help.yml permissions.yml).each do |f|
  template "#{node['minecraft']['install_dir']}/#{f}" do
    owner node['minecraft']['user']
    group node['minecraft']['group']
    mode 0644
    action :create
    notifies :restart, 'runit_service[minecraft]', :delayed if node['minecraft']['autorestart']
  end
end
