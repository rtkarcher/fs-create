Cookbook Name:: fs-create 
#
# Recipe:: default
#
# Copyright 2014
#

include_recipe "lvm::default"

# Create appsvc group
group "appsvc" do 
  action: create
end

# Then add splunk and mapred users to the group
group "['appsvc']['service']['group']" do 
  action :manage 
  members node['appsvc']['service']['users']
  append true
end

# Create mount point (/opt/appsvc/logs directory) and set permissions
directory node['appsvc']['service']['dir'] do
  owner "mapred"
  group "appsvc"
  mode 00775
  action :create
  recursive true
end

# Create filesystem and mount at /opt/appsvc/logs
lvm_logical_volume node['appsvc']['service']['name'] do
  group node['appsvc']['volume-group']['name']
  size node['appsvc']['service']['size']
  filesystem node['appsvc']['filesystem']['type']
  mount_point node['appsvc']['service']['dir']
  action [:create]
end

# Delete lost+found from /opt/appsvc/logs
directory "/opt/appsvc/logs/lost+found" do
  recursive true
  action :delete
end
