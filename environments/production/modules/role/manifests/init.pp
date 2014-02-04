# Class: role
#
# This module manages role
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class role::nonhadoop {
  include etchosts
  include profile::puppetmaster
  include profile::rootpass
  include profile::cups
  include profile::nrpe
  include profile::ntpconfig
  include profile::rootsshkey
  include camstar::accounts
  include ganglia
}

class role::hadoop inherits role::nonhadoop {
  include profile::datazero
  include profile::hadooplimits
  include profile::hadoopsysctl
  include profile::mtu9000
  include profile::thpnever
  include cloudera::hadoopaccounts
  include ganglia
  include cloudera::agent
}
