Cookbook Name:: fs-create 
#
# Recipe:: default
#
# Copyright 2014
#

include_recipe "lvm::default"

# Create appsvc user group, then add splunk and mapred users
# $ groupadd appsvc
# $ usermod -a -G appsvc splunk && usermod -a -G appsvc mapred

# Create /opt/appsvc/logs directory and set permissions
directory node['appsvc']['service']['dir'] do
  owner "mapred"
  group "appsvc"
  mode 00775
  action :create
  recursive true
end

#Create filesystem and mount at /opt/appsvc/logs
lvm_logical_volume node['appsvc']['service']['name'] do
group node['appsvc']['volume-group']['name']
size node['appsvc']['service']['size']
filesystem node['appsvc']['filesystem']['type']
mount_point node['appsvc']['service']['dir']
action [:create]
end

# Echo mount point to /etc/fstab
# $ echo "/dev/vg00/lvname /opt/appsvc/logs ext4 defaults 0 0 " >> /etc/fstab

#Delete lost+found from /opt/appsvc/logs
directory "/opt/appsvc/logs/lost+found" do
recursive true
action :delete
end
