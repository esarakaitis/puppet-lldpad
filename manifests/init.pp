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

$once_lock="/var/lock/puppet-once"

exec { 'run-once-commands':
        command => "/bin/touch $once_lock",
        creates => $once_lock,
        notify => [Exec['lldptool adminstatus eth0']],
}

exec    { 'lldptool adminstatus eth0':
        command => "/usr/sbin/lldptool -L -i eth0 adminstatus=rxtx",
        require => Package['lldpad'],
        notify => [Exec['lldptool adminstatus ncb eth0']],
        refreshonly => true,
        }

exec    { 'lldptool adminstatus ncb eth0':
        command => "/usr/sbin/lldptool -i eth0 -g ncb -L adminstatus=rxtx",
        require => Package['lldpad'],
        notify => [Exec['lldptool adminstatus eth1']],
        refreshonly => true,
        }

exec    { 'lldptool adminstatus eth1':
        command => "/usr/sbin/lldptool -L -i eth1 adminstatus=rxtx",
        require => Package['lldpad'],
        notify => [Exec['lldptool adminstatus ncb eth1']],
        refreshonly => true,
        }

exec    { 'lldptool adminstatus ncb eth1':
        command => "/usr/sbin/lldptool -i eth1 -g ncb -L adminstatus=rxtx",
        require => Package['lldpad'],
        refreshonly => true,
        }
}

