#
# Author:: Jörgen Brandt <joergen.brandt@onlinehome.de>
# Cookbook:: chef-cuneiform
# Attributes:: default
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

default['cuneiform']['cuneiform']['version'] = '3.0.4'
default['cuneiform']['cre']['version']       = '0.1.8'
default['cuneiform']['cf_worker']['version'] = '0.1.6'
default['cuneiform']['cf_client']['version'] = '0.1.6'
default['cuneiform']['effi']['version']      = '0.1.6'

default['rebar3']['version']                 = '3.6.2'

default['erlang']['install_method']          = 'source'
default['erlang']['source']['version']       = '21.1'
default['erlang']['source']['checksum']      = 'a489ca88d79422a165112120e0295bbd2f777533a81eae5610578d1bd8d89caf'

