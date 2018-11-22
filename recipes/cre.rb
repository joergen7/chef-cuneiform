#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    cre
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


