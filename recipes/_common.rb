#
# Cookbook Name:: chef-cuneiform
# Recipe:: _common
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.


bash "apt-get_update" do
  code "apt-get update"
end

