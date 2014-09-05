fs-create
=========

This Chef cookbook leverages the existing lvm community cookbook in creating customized logical volumes and mounted filesystems

* Partition a 5GB logical volume (`lvname`) from the `vg00` volume group
* Format the newly-created `lvname` for `ext4` and mount at `/opt/appsvc/logs`, then create a mount point entry in `/etc/fstab`
* Create a user group called `appsvc`
* Add the `splunk` and `mapred` users to the `appsvc` group
* Change the owner of `/opt/appsvc/logs/` to user `mapred`, group `appsvc` and set permissions to 775
* Delete the new `lost+found` directory in `/opt/appsvc/logs/`



Requirements
-------------------

This cookbook has the following dependencies:

| Cookbook | Type | Recipe  | Version  | Repo URL |
|----------|------|---------|----------|----------|
| lvm   | Community | default | 1.1.0+ | [https://github.com/opscode-cookbooks/lvm](https://github.com/opscode-cookbooks/lvm) |



Attributes
--------------

By default, this cookbook works best when run against a CentOS or RHEL 6.5 machine.

Currently, the only override attributes defined in the .kitchen.yml file are intended for testing purposes - the user array is defined as containing the `root` and `nobody`users instead of the `mapred` and `splunk` users (in the event that they are absent on the test system).


#### fs-create::default

The following attributes controls the invocation of the specific recipes.

|Key|Type|Description|Default|
|---|----|-----------|-------|
|['appsvc']['service']['users']| array | Users added to `appsvc` group | "splunk","mapred" |
|['appsvc']['volume-group']['name']| string | Volume group for partitioning | "vg00" |
|['appsvc']['filesystem']['type']| string | Filesystem type for logical volume | ext4 |
|['appsvc']['service']['name']| string | Logical volume name | "lvname" |
|['appsvc']['service']['size']| string | Logical volume size | 5G |
|['appsvc']['service']['dir']| string | Logical volume mount point | /opt/appsvc/logs |


Usage
---------
#### fs-create::default

Just include `fs-create` in your Chef node's `run_list`:

```json
{
  "name":"node_name",
  "run_list": [
    "recipe[fs-create]"
  ]
}
```



Contributing
-----------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Compose your change(s)
4. Write tests for your change(s) (if applicable)
5. Submit to testing until all tests are successful
6. Submit a Pull Request using Github


License and Authors
----------------------------
Author: [Rainer Karcher](https://github.com/rtkarcher)



