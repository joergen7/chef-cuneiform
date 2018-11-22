#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    cf_worker
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


