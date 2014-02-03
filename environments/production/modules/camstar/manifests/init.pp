# == Class: camstar
#
# Full description of class camstar here.
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
#  class { camstar:
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
class camstar::users {

  @user { 'rsletten':
    uid        => '2000',
    gid        => '2000',
    shell      => '/bin/bash',
    home       => '/home/rsletten',
    managehome => true,
    comment    => 'Rob Sletten',
    ensure     => present,
  }

  @user { 'jthomas':
    uid        => '2001',
    gid        => '2001',
    shell      => '/bin/bash',
    home       => '/home/jthomas',
    managehome => true,
    comment    => 'James Thomas',
    ensure     => present,
  }

}

class camstar::accounts {
  require camstar::users
  realizer(User['rsletten'])
  realizer(User['jthomas'])
}

