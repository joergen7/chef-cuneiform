#
# Cookbook Name:: chef-cuneiform
# Recipe:: default
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.

cuneiform_dir = "#{node.dir.software}/cuneiform"
cuneiform_bin = "#{cuneiform_dir}/cuneiform-dist/target"

package "openjdk-7-jdk"
package "r-base"
package "maven"
package "scala"
package "octave"
package "clisp"
package "git"
package "graphviz"

directory node.dir.software

git "git_clone_cuneiform" do
  action :checkout
  repository node.github.cuneiform
  destination cuneiform_dir
  revision "master"
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
java -cp #{cuneiform_bin}/cuneiform-dist-2.0.3-SNAPSHOT.jar de.huberlin.wbi.cuneiform.logview.main.Main $@  
  CONTENT
  mode '0755'
end

file "#{node.dir.bin}/cfide" do
  content <<-CONTENT
#!/usr/bin/env bash
java -cp #{cuneiform_bin}/cuneiform-dist-2.0.3-SNAPSHOT.jar de.huberlin.wbi.cuneiform.cfide.main.Main $@  
  CONTENT
  mode '0755'
end

file "#{node.dir.bin}/cuneiform" do
  content <<-CONTENT
#!/usr/bin/env bash
nice -n 19 java -jar #{cuneiform_bin}/cuneiform-dist-2.0.3-SNAPSHOT.jar -l /tmp/cf-cache $@  
  CONTENT
  mode '0755'
end
