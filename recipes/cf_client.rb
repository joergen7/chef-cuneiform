#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    cf_client
#
# Copyright:: 2015-2018 Jörgen Brandt
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

cf_client_version = node['cuneiform']['cf_client']['version']
cf_client_dir     = "/tmp/cf_client-#{cf_client_version}"
cf_client_github  = 'https://github.com/joergen7/cf_client.git'

git 'git_clone_cf_client' do
  repository cf_client_github
  destination cf_client_dir
  revision cf_client_version
end

bash 'compile_cf_client' do
  code 'rebar3 escriptize'
  cwd cf_client_dir
  environment 'PATH' => "/usr/local/bin:#{ENV['PATH']}"
  creates "#{cf_client_dir}/_build/default/bin/cf_client"
end

bash 'install_cf_client' do
  code "cp #{cf_client_dir}/_build/default/bin/cf_client /usr/local/bin"
  creates "/usr/local/bin/cf_client"
end


