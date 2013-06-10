#
# Cookbook Name:: pypi
# Recipe:: default
#
# Copyright 2013, Kwarter, Inc
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

python_virtualenv 'pypi' do
  path node[:pypi][:virtualenv]
  owner node[:pypi][:user]
  group node[:pypi][:group]
  action :create
end

python_pip 'pep381client' do
  virtualenv node[:pypi][:virtualenv]
end

directory "#{node[:pypi][:virtualenv]}/data" do
  owner node[:pypi][:user]
  group node[:pypi][:group]
end

cron_d 'pypi_mirror' do
  user 'root'
  command "#{node[:pypi][:virtualenv]}/bin/pep381run -q #{node[:pypi][:virtualenv]}/data"
  minute 0
  hour 1
  action :create
end
