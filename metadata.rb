name "fs-create"
maintainer "Rainer Karcher"
maintainer_email "rainer.tobias.karcher@gmail.com"
license "All rights reserved"
description "This Chef cookbook leverages the existing lvm community cookbook in creating customized logical volumes and mounted filesystems."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.1.0"

depends 'lvm'
