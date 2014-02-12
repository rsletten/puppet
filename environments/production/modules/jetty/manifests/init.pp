# == Class: jetty
#
# Full description of class jetty here.
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
#  class { jetty:
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
class jetty {
  class { '::jetty::home': } ->
  class { '::jetty::user': } ->
  class { '::jetty::jdk': } ->
  class { '::jetty::tuning': } ->
  class { '::jetty::limits': } ->
  class { '::jetty::repo': } ->
  class { '::jetty::package': } ->
  class { '::jetty::config': } ->
  Class ['jetty']
}

class jetty::user {

  @group { 'cscprod':
    gid    => '3000',
    ensure => 'present',
  }

  @user { 'cscprod':
    uid        => '3000',
    gid        => '3000',
    shell      => '/bin/bash',
    home       => '/webservices/jettyhome',
    managehome => 'true',
    comment    => 'Jetty Service Account',
    ensure     => 'present',
  }

  realize(Group['cscprod'])
  realize(User['cscprod'])
}

class jetty::home {

  file { '/webservices':
    ensure => 'directory',
    mode   => '0755',
  }
}

class jetty::jdk {

  package { 'jdk':
    ensure => 'present',
  }
}
