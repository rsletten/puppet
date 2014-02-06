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
    password   => '$1$kiX8uPDu$/1mym42AJ37dR93SHpAuO0',
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
    password   => '$6$EadLCF4d$qytK78zmIRFcIto3MoEnK07HRIxKv1R80Ul21w6GULRjEQOujZ5Gos2FzguSiz8zJi/SiL/VSL.NixgttLASW/',
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
    password   => '$6$WVQaRPE6$VxEEk09LlhnywOwd8xWzjkUWvGh3t/vvm5exoHj7gCZSyz/H7Z4A3rpUJ7q0CXgqjIz0nz4nP5ljBeHe8rL86/',
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
    password   => '$6$anxaHrsb$mn.AMXRiOwAnr3YhNYvbds1pi8KPchTIQcj3lMEQWk4dngEnMZ4/XYvqunXXGXdWC9Qq.V.i7CiphIpwrolGk0',
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
    password   => '$6$/8tDLCL1$/vgdrpK8ecHozZjwsTsSXXFk2gTaeMsbjoZkNkkFmiUGL0nmkJD.nzvesur3jVsZSdLMJNk.wR9Ys0dy4JICV1',
    comment    => 'Soma Seedharalu',
    ensure     => present,
  }

  # Kat
  @group { 'kdevalk':
    gid    => '2006',
    ensure => present,
  }

  @user { 'kdevalk':
    uid        => '2006',
    gid        => '2006',
    shell      => '/bin/bash',
    home       => '/home/kdevalk',
    managehome => true,
    password   => '$6$sPt4fBSJ$OL4r3bPXVY98zjzZr.bS4y53jD5nxmZ3JAAU8zJZcAV49ZsTGxRDsuyKmnyCxsMp.vyAtUV6muoT0aaeY/EWg1',
    comment    => 'Kathleen Devalk',
    ensure     => present,
  }

  # Nick
  @group { 'naghazarian':
    gid    => '2007',
    ensure => present,
  }

  @user { 'naghazarian':
    uid        => '2007',
    gid        => '2007',
    shell      => '/bin/bash',
    home       => '/home/naghazarian',
    managehome => true,
    password   => '$6$sigIlFmt$h5bqbPuMHvnu8k8aWYfE1/bFeKpCELcyZNZls1dOn7zd/flx1VNdnaX4Wz0HUJbchy/mMaqKu/g1Qo23liEEm/',
    comment    => 'Nick Aghazarian',
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
  realize(Group['kdevalk'])
  realize(Group['naghazarian'])
  realize(User['rsletten'])
  realize(User['jthomas'])
  realize(User['kfarmer'])
  realize(User['dmaloney'])
  realize(User['pcliu'])
  realize(User['sseedharalu'])
  realize(User['kdevalk'])
  realize(User['naghazarian'])
}

