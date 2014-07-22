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


service { 'lldpad':
        ensure => running,
        enable => true,
        }

exec    { 'lldptool adminstatus eth0':
        command => "/usr/sbin/lldptool -L -i eth0 adminstatus=rxtx",
        require => Package['lldpad'],
        }

exec    { 'lldptool adminstatus ncb eth0':
        command => "/usr/sbin/lldptool -i eth0 -g ncb -L adminstatus=rxtx",
        require => Package['lldpad'],
        }

exec    { 'lldptool adminstatus eth1':
        command => "/usr/sbin/lldptool -L -i eth1 adminstatus=rxtx",
        require => Package['lldpad'],
        }

exec    { 'lldptool adminstatus ncb eth1':
        command => "/usr/sbin/lldptool -i eth1 -g ncb -L adminstatus=rxtx",
        require => Package['lldpad'],
        }
}

