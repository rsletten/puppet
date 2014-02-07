# == Class: openipmi
#
# Full description of class openipmi here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { openipmi:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class openipmi {
  class { '::openipmi::package': } ->
  class { '::openipmi::service': } ->
  Class['openipmi']
}

class openipmi::package {
  package { 'OpenIPMI':
    ensure => 'installed',
  }
  package { 'ipmitool':
    ensure => 'installed',
  }
}

class openipmi::service {
  service { 'ipmi':
    ensure     => running,
    hasstatus  => 'true',
    hasrestart => 'true',
    enable     => 'true',
    require    => Class['openipmi::package'],
  }
}

