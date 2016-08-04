#
# Cookbook Name:: chef-cuneiform
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

cuneiform_vsn    = "2.2.0-release"
cuneiform_dir    = "#{node["dir"]["software"]}/cuneiform-#{cuneiform_vsn}"
cuneiform_bin    = "#{cuneiform_dir}/_build/default/bin"
cuneiform_github = "https://github.com/joergen7/cuneiform.git"

include_recipe "chef-misc::rebar3"

package "r-base"
package "rlwrap"

directory node["dir"]["software"]

git "git_clone_cuneiform" do
  action :checkout
  repository cuneiform_github
  destination cuneiform_dir
  revision cuneiform_vsn
end

bash "install_cuneiform" do
  code "make"
  cwd cuneiform_dir
  creates "#{cuneiform_dir}/_build/default/bin/cuneiform"
end

file "#{node["dir"]["bin"]}/cuneiform" do
  content "rlwrap #{cuneiform_dir}/_build/default/bin/cuneiform $@"
  mode "0755"
end