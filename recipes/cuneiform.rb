#
# Cookbook Name:: chef-cuneiform
# Recipe:: default
#
# Copyright (c) 2015-2018 Jörgen Brandt, All Rights Reserved.

cuneiform_vsn    = node["cuneiform"]["vsn"]
cuneiform_dir    = "#{node["dir"]["software"]}/cuneiform-#{cuneiform_vsn}"
cuneiform_bin    = "#{cuneiform_dir}/_build/default/bin"
cuneiform_github = "https://github.com/joergen7/cuneiform.git"

include_recipe "chef-misc::rebar3"

package "octave"

directory node["dir"]["software"]

git "git_clone_cuneiform" do
  action :checkout
  repository cuneiform_github
  destination cuneiform_dir
  revision cuneiform_vsn
end

bash "compile_cuneiform" do
  code "rebar3 escriptize"
  cwd cuneiform_dir
  creates "#{cuneiform_dir}/_build/default/bin/cuneiform"
end

link "/usr/local/bin/cuneiform" do
  to "#{cuneiform_dir}/_build/default/bin/cuneiform"
end
