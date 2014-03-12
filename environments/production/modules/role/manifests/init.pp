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

class role {}

class role::nonhadoop {
  include etchosts
  include profile::puppetmaster
  include profile::rootpass
  include profile::cups
  include profile::nrpe
  include profile::ntpconfig
  include profile::rootsshkey
  include profile::xwindows
  include camstar::accounts
  include ganglia
  include func
  include openipmi
  include profile::mcollective-client
}

class role::virtual {
  include etchosts
  include profile::puppetmaster
  include profile::rootpass
  include profile::cups
  include profile::nrpe
  include profile::ntpconfig
  include profile::rootsshkey
  include profile::xwindows
  include camstar::accounts
  include ganglia
  include func
  include profile::mcollective-client
}

class role::hadoop inherits role::nonhadoop {
  include profile::datazero
  include profile::hadooplimits
  include profile::hadoopsysctl
  include profile::mtu9000
  include profile::thpnever
  include cloudera::hadoopaccounts
  include cloudera::agent
  include cloudera::zkensemble
  include profile::jksfiles
}

class role::manager {
  include etchosts
  include profile::cups
  include profile::mtu9000
  include profile::rootpass
  include cloudera::hadoopaccounts
  include profile::rootsshkey
  include ganglia::manager
  include cloudera::manager
  include openipmi
  include profile::gituser
  include camstar::accounts
  include profile::mcollective-server
}
