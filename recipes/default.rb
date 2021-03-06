#
# Author::    Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook::  chef-cuneiform
# Recipe::    default
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

## Install Cuneiform


include_recipe 'chef-rebar3::rebar3'
include_recipe 'chef-cuneiform::cuneiform'
include_recipe 'chef-cuneiform::cre'
include_recipe 'chef-cuneiform::cf_worker'
include_recipe 'chef-cuneiform::cf_client'
include_recipe 'chef-cuneiform::effi'


