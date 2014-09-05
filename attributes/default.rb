# Global Filesystem Attributes

default['refrecord']['volume-group']['name'] = "vg00"
default['refrecord']['filesystem']['type'] = "ext4"

# Filesystem to mount at /opt/refrecord/logs

default['refrecord']['service']['name'] = "lvname"
default['refrecord']['service']['size'] = "5G"
default['refrecord']['service']['dir'] = "/opt/appsvc/logs"
default['refrecord']['service']['device'] = "/dev/mapper/vg00-lvname"
