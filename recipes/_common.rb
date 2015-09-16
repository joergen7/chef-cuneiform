#
# Cookbook Name:: chef-cuneiform
# Recipe:: _common
#
# Copyright (c) 2015 Jörgen Brandt, All Rights Reserved.


if platform_family?( "debian" )

  bash "apt-get_update" do
    code "apt-get update; apt-get upgrade -y"
  end

elsif platform_family?( "fedora" )

  bash "dnf_update" do
    code "yum update -y"
  end
  
else
	
  raise "Platform not recognized."
  
end
