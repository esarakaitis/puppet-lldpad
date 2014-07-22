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
class git {
  package { 'lldpad':
    ensure => installed,
  }
}
