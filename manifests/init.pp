# Class: git
#
# This class installs lldpad
#
# Actions:
#   - Install the lldpad package
#
# Sample Usage:
#  class { 'lldpad': }
#
class lldpad {
  package { 'lldpad':
    ensure => installed,
  }
}

exec 	{ 'lldptool adminstatus eth0':
	command => 'lldptool -L -i eth0 adminstatus=rxtx',
	}

exec	{ 'lldptool adminstatus ncb eth0':
	command => 'lldptool -i eth0 -g ncb -L adminstatus=rxtx',
	}
exec    { 'lldptool adminstatus eth1':
        command => 'lldptool -L -i eth1 adminstatus=rxtx',
        }

exec    { 'lldptool adminstatus ncb eth1':
        command => 'lldptool -i eth1 -g ncb -L adminstatus=rxtx',
        }
