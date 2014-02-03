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

  # Rob Sletten
  @group { 'rsletten':
    gid    => '2000',
    ensure => present,
  }

  @user { 'rsletten':
    uid        => '2000',
    gid        => '2000',
    shell      => '/bin/bash',
    home       => '/home/rsletten',
    managehome => true,
    password   => '$1$pwujD8if$I0Nq2kBEFZQ8nBnpMXDDW/',
    comment    => 'Rob Sletten',
    ensure     => present,
  }

  # James Thomas
  @group { 'jthomas':
    gid    => '2001',
    ensure => present,
  }

  @user { 'jthomas':
    uid        => '2001',
    gid        => '2001',
    shell      => '/bin/bash',
    home       => '/home/jthomas',
    managehome => true,
    password   => '$1$d2NPLbi8$M/vGY8S4rJ1A4spTMlZFU.',
    comment    => 'James Thomas',
    ensure     => present,
  }

  # Kevin Farmer
  @group { 'kfarmer':
    gid    => '2002',
    ensure => present,
  }

  @user { 'kfarmer':
    uid        => '2002',
    gid        => '2002',
    shell      => '/bin/bash',
    home       => '/home/kfarmer',
    managehome => true,
    password   => '$1$SrOicrFj$Wn8XVsnmibsPaUM8NsyQB0',
    comment    => 'Kevin Farmer',
    ensure     => present,
  }

  # Dan Maloney
  @group { 'dmaloney':
    gid    => '2003',
    ensure => present,
  }

  @user { 'dmaloney':
    uid        => '2003',
    gid        => '2003',
    shell      => '/bin/bash',
    home       => '/home/dmaloney',
    managehome => true,
    password   => '$1$SrOicrFj$Wn8XVsnmibsPaUM8NsyQB0',
    comment    => 'Dan Maloney',
    ensure     => present,
  }

  # PenCheng
  @group { 'pcliu':
    gid    => '2004',
    ensure => present,
  }

  @user { 'pcliu':
    uid        => '2004',
    gid        => '2004',
    shell      => '/bin/bash',
    home       => '/home/pcliu',
    managehome => true,
    password   => '$1$SrOicrFj$Wn8XVsnmibsPaUM8NsyQB0',
    comment    => 'PengCheng Liu',
    ensure     => present,
  }

  # Soma
  @group { 'sseedharalu':
    gid    => '2005',
    ensure => present,
  }

  @user { 'sseedharalu':
    uid        => '2005',
    gid        => '2005',
    shell      => '/bin/bash',
    home       => '/home/sseedharalu',
    managehome => true,
    password   => '$1$SrOicrFj$Wn8XVsnmibsPaUM8NsyQB0',
    comment    => 'Soma Seedharalu',
    ensure     => present,
  }

}

class camstar::accounts {
  require camstar::users
  realize(Group['rsletten'])
  realize(Group['jthomas'])
  realize(Group['kfarmer'])
  realize(Group['dmaloney'])
  realize(Group['pcliu'])
  realize(Group['sseedharalu'])
  realize(User['rsletten'])
  realize(User['jthomas'])
  realize(User['kfarmer'])
  realize(User['dmaloney'])
  realize(User['pcliu'])
  realize(User['sseedharalu'])
}

