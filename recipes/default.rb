#
# Cookbook Name:: chef-cuneiform
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

cuneiform_dir = "#{node.dir.software}/cuneiform"
cuneiform_bin = "#{cuneiform_dir}/cuneiform-dist/target/cuneiform-dist-2.0.2-SNAPSHOT/cuneiform-2.0.2-SNAPSHOT"



include_recipe "chef-cuneiform::_common"

package "openjdk-7-jdk"
package "maven"
package "scala"
package "octave"
package "bsh"
package "clisp"
package "r-base"
package "git"
package "graphviz"

directory node.dir.software

git "git_clone_cuneiform" do
  action :checkout
  repository node.github.cuneiform
  destination cuneiform_dir
end

bash "mvn_compile_cuneiform" do
  code <<-SCRIPT
mvn clean package
  SCRIPT
  cwd cuneiform_dir
  not_if "#{Dir.exists?( "#{cuneiform_dir}/cuneiform-dist/target" )}"
end

file "#{node.dir.bin}/logview" do
  content <<-CONTENT
#!/usr/bin/env bash
java -cp \"#{cuneiform_bin}:#{cuneiform_bin}/lib/*:#{cuneiform_bin}/bin/*\" de.huberlin.wbi.cuneiform.logview.main.Main $@  
  CONTENT
  mode '0755'
end

file "#{node.dir.bin}/cfide" do
  content <<-CONTENT
#!/usr/bin/env bash
java -cp \"#{cuneiform_bin}:#{cuneiform_bin}/lib/*:#{cuneiform_bin}/bin/*\" de.huberlin.wbi.cuneiform.cfide.main.Main $@  
  CONTENT
  mode '0755'
end

file "#{node.dir.bin}/cuneiform" do
  content <<-CONTENT
#!/usr/bin/env bash
nice -n 19 java -cp \"#{cuneiform_bin}:#{cuneiform_bin}/lib/*:#{cuneiform_bin}/bin/*\" de.huberlin.wbi.cuneiform.cmdline.main.Main -l /tmp/cf-cache $@  
  CONTENT
  mode '0755'
end
