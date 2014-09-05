# Users to be added to the appsvc user group
default['appsvc']['service']['users'] = ["splunk","mapred"]

# Global Filesystem Attributes

default['appsvc']['volume-group']['name'] = "vg00"
default['appsvc']['filesystem']['type'] = "ext4"

# Filesystem to mount at /opt/appsvc/logs

default['appsvc']['service']['name'] = "lvname"
default['appsvc']['service']['size'] = "5G"
default['appsvc']['service']['dir'] = "/opt/appsvc/logs"
default['appsvc']['service']['device'] = "/dev/mapper/vg00-lvname"
