#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    cuneiform
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

include_recipe 'chef-rebar3::rebar3'

# Cuneiform

cuneiform_version = node['cuneiform']['cuneiform']['version']
cuneiform_dir     = "/tmp/cuneiform-#{cuneiform_version}"
cuneiform_github  = 'https://github.com/joergen7/cuneiform.git'

git 'git_clone_cuneiform' do
  repository cuneiform_github
  destination cuneiform_dir
  revision cuneiform_version
end

bash 'compile_cuneiform' do
  code 'rebar3 escriptize'
  cwd cuneiform_dir
  environment 'PATH' => "/usr/local/bin:#{ENV['PATH']}"
  creates "#{cuneiform_dir}/_build/default/bin/cuneiform"
end


bash 'install_cuneiform' do
  code "cp #{cuneiform_dir}/_build/default/bin/cuneiform /usr/local/bin"
  creates "/usr/local/bin/cuneiform"
end


# Common runtime environment

cre_version = node['cuneiform']['cre']['version']
cre_dir     = "/tmp/cre-#{cre_version}"
cre_github  = 'https://github.com/joergen7/cre.git'

git 'git_clone_cre' do
  repository cre_github
  destination cre_dir
  revision cre_version
end

bash 'compile_cre' do
  code 'rebar3 escriptize'
  cwd cre_dir
  environment 'PATH' => "/usr/local/bin:#{ENV['PATH']}"
  creates "#{cre_dir}/_build/default/bin/cre"
end


bash 'install_cre' do
  code "cp #{cre_dir}/_build/default/bin/cre /usr/local/bin"
  creates "/usr/local/bin/cre"
end


# Cuneiform worker

cf_worker_version = node['cuneiform']['cf_worker']['version']
cf_worker_dir     = "/tmp/cf_worker-#{cf_worker_version}"
cf_worker_github  = 'https://github.com/joergen7/cf_worker.git'

git 'git_clone_cf_worker' do
  repository cf_worker_github
  destination cf_worker_dir
  revision cf_worker_version
end

bash 'compile_cf_worker' do
  code 'rebar3 escriptize'
  cwd cf_worker_dir
  environment 'PATH' => "/usr/local/bin:#{ENV['PATH']}"
  creates "#{cf_worker_dir}/_build/default/bin/cf_worker"
end


bash 'install_cf_worker' do
  code "cp #{cf_worker_dir}/_build/default/bin/cf_worker /usr/local/bin"
  creates "/usr/local/bin/cf_worker"
end


# Cuneiform client

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
