#
# Cookbook Name:: chef-cuneiform
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

cuneiform_dir = "#{node.dir.software}/cuneiform"
cuneiform_bin = "#{cuneiform_dir}/_build/default/bin"
cuneiform_vsn = "2.2.0-release"

include_recipe "chef-misc::rebar3"

package "r-base"

directory node.dir.software

git "git_clone_cuneiform" do
  action :checkout
  repository node.github.cuneiform
  destination cuneiform_dir
  revision cuneiform_vsn
end

bash "install_cuneiform" do
  code "make install"
  cwd cuneiform_dir
  not_if "#{File.exists?( "#{node.dir.bin}/cuneiform" )}"
end
