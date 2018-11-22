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

bash 'install_cf_script' do
  code "cp #{cuneiform_dir}/priv/cf_script /usr/local/bin"
  creates "/usr/local/bin/cf_script"
end

