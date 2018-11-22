#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    effi
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

effi_version = node['cuneiform']['effi']['version']
effi_dir     = "/tmp/effi-#{effi_version}"
effi_github  = 'https://github.com/joergen7/effi.git'

git 'git_clone_effi' do
  repository effi_github
  destination effi_dir
  revision effi_version
end

bash 'compile_effi' do
  code 'rebar3 escriptize'
  cwd effi_dir
  environment 'PATH' => "/usr/local/bin:#{ENV['PATH']}"
  creates "#{effi_dir}/_build/default/bin/effi"
end


bash 'install_effi' do
  code "cp #{effi_dir}/_build/default/bin/effi /usr/local/bin"
  creates "/usr/local/bin/effi"
end
