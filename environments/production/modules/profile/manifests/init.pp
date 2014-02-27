# Class: profile
#
# This module manages profile
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#

class profile {}

class profile::xwindows {
  package { 'xorg-x11-xauth':
    ensure  => 'installed',
    require => Augeas['X11UseLocalhost'],
  }

  service { 'sshd':
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
  }

  augeas { 'X11UseLocalhost':
    context => '/files/etc/ssh/sshd_config',
    changes => "set X11UseLocalhost no",
    notify  => Service["sshd"],
  }
}

class profile::puppetmaster {
  $pupmaster = hiera('puppetmaster')
  file { "/etc/puppet/puppet.conf":
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template('profile/puppet.conf.erb'),
  }
}

class profile::cups {
  service { 'cups':
      ensure   => stopped,
      enable => false
  }
}

class profile::datazero {
  file { "/data0":
    ensure => directory,
    mode   => 0755,
    owner  => "root",
    group  => "root",
  }
}

class profile::hadooplimits {
  limits::limits { 'hdfs_nofile':
      ensure     => present,
      user       => 'hdfs',
      limit_type => 'nofile',
      both       => 32768,
    }

  limits::limits { 'hbase_nofile':
      ensure     => present,
      user       => 'hbase',
      limit_type => 'nofile',
      both       => 32768,
    }

  limits::limits { 'hdfs_noproc':
      ensure     => present,
      user       => 'hdfs',
      limit_type => 'nproc',
      both       => 32768,
    }

  limits::limits { 'hbase_noproc':
      ensure     => present,
      user       => 'hbase',
      limit_type => 'nproc',
      both       => 32768,
    }

  limits::limits { 'root_nofile':
      ensure     => present,
      user       => 'root',
      limit_type => 'nofile',
      both       => 32768,
    }

  limits::limits { 'solr_nofile':
      ensure     => present,
      user       => 'solr',
      limit_type => 'nofile',
      both       => 32768,
    }

  limits::limits { 'solr_nproc':
      ensure     => present,
      user       => 'solr',
      limit_type => 'nproc',
      both       => 32768,
    }
}

class profile::hadoopsysctl {
  sysctl { 'vm.swappiness': value                      => '0' }
  sysctl { 'net.ipv6.conf.all.disable_ipv6': value     => '1' }
  sysctl { 'net.ipv6.conf.default.disable_ipv6': value => '1' }
}

class profile::mtu9000 {
  augeas { "ifcfg-bond0":
    context => '/files/etc/sysconfig/network-scripts/ifcfg-bond0',
    changes => "set MTU '9000'",
  }
}

class profile::nrpe {
  file { "/etc/nagios/nrpe.cfg":
    notify => Service["nrpe"],
    ensure => present,
    owner  => 'nagios',
    group  => 'nagios',
    mode   => 0600,
    source => "puppet:///files/nrpe.cfg"
  }

  file { "/usr/lib64/nagios/plugins/check_mem.sh":
    ensure => present,
    owner  => 'nagios',
    group  => 'nagios',
    mode   => 0755,
    source => "puppet:///files/check_mem.sh"
  }

  service { "nrpe":
    ensure => running,
    enable => true
  }
}

class profile::ntpconfig {
  class { '::ntp':
    servers    => [ '10.40.20.43' ],
    restrict => ['127.0.0.1'],
  }
}

class profile::rootpass {
  user { 'root':
    ensure   => 'present',
    password => '$6$D2mjY2V7$A86taB5K3WQPimP4cH5/LsTkGIoYwv6WZqcAj9PqyZs8kFtWAL9/wZ8GeDPcyg/xrZkBv4ML0nEjHHlISUizN0',
  }
}

class profile::rootsshkey {
  ssh_authorized_key { 'root':
    user   => "root",
    ensure => present,
    type   => "ssh-rsa",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDLoNDo+HkY+nEQ5jd89NtJxdp6B/fjNMoKuxV+1ovtdrjmGp7CYYe39GwvMqTFi3vxjL+uWJYbIEkPdidbN/IdmSeNyGIILCVSe8PUAgJF2nWofiWsBvflHHWdow3vhIF/k+WBRO39vaq86Qln7I19qtI2QnPzgLgNW0uuUEyIjeKpIvDy33gajGWQoOyTh4ACibsgu8yf+YTgykIq+a0xDf/O6rngQsdbiXZdbm8j8sx81p9q3vVo/2wk2qywiYdx24X5aEedSnQqT6U/cbhLHHq0LM+ZvMvDCfOY4dsraRucj8rg1GxSRn9XezEuv3njd0HK8uoREWP8ch6M2+gN",
    name   => "root"
  }

  file { '/root/.ssh/id_rsa':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///files/id_rsa',
  }

  file { '/root/.ssh/config':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///files/config',
  }
}

class profile::thpnever {
  augeas { "grub-set-thp-never":
    context   => "/files/boot/grub/grub.conf",
    changes => [ "setm title[*]/kernel/ transparent_hugepage never"]
  } 
}

class profile::jksfiles {
  require cloudera::hadoopaccounts
  file { "/home/hdfs":
    ensure => 'directory',
    owner  => 'hdfs',
    group  => 'hdfs',
  }

  file { "/home/hdfs/ssl":
    ensure => 'directory',
    owner  => 'hdfs',
    group  => 'hdfs',
  }

  file { "/home/hdfs/ssl/keystore.jks":
    ensure => present,
    owner  => 'hdfs',
    group  => 'hdfs',
    mode   => 0644,
    source => "puppet:///files/keystore.jks"
  }

  file { "/home/hdfs/ssl/truststore.jks":
    ensure => present,
    owner  => 'hdfs',
    group  => 'hdfs',
    mode   => 0644,
    source => "puppet:///files/truststore.jks"
  }
}

class profile::hostsfile {
  host { 'puppet':
    ensure => absent,
    ip     => $::puppetmaster,
    target => '/etc/hosts'
  }
  host { 'csc-sn03.saas.local':
    ensure       => present,
    ip           => '10.40.20.43',
    host_aliases => [ 'csc-sn03', 'build' ],
    target       => '/etc/hosts'
  }
  host { 'csc-mn00.saas.local':
    ensure       => present,
    ip           => '10.40.20.30',
    host_aliases => 'csc-mn00',
    target       => '/etc/hosts'
  }
  host { 'csc-mn01.saas.local':
    ensure       => present,
    ip           => '10.40.20.31',
    host_aliases => 'csc-mn01',
    target       => '/etc/hosts'
  }
  host { 'csc-mn02.saas.local':
    ensure       => present,
    ip           => '10.40.20.32',
    host_aliases => 'csc-mn02',
    target       => '/etc/hosts'
  }
  host { 'csc-sn00.saas.local':
    ensure       => present,
    ip           => '10.40.20.40',
    host_aliases => 'csc-sn00',
    target       => '/etc/hosts'
  }
  host { 'csc-sn01.saas.local':
    ensure       => present,
    ip           => '10.40.20.41',
    host_aliases => 'csc-sn01',
    target       => '/etc/hosts'
  }
  host { 'csc-sn02.saas.local':
    ensure       => present,
    ip           => '10.40.20.42',
    host_aliases => 'csc-sn02',
    target       => '/etc/hosts'
  }
  host { 'csc-wn00.saas.local':
    ensure       => present,
    ip           => '10.40.20.50',
    host_aliases => 'csc-wn00',
    target       => '/etc/hosts'
  }
  host { 'csc-wn01.saas.local':
    ensure       => present,
    ip           => '10.40.20.51',
    host_aliases => 'csc-wn01',
    target       => '/etc/hosts'
  }
  host { 'csc-wn02.saas.local':
    ensure       => present,
    ip           => '10.40.20.52',
    host_aliases => 'csc-wn02',
    target       => '/etc/hosts'
  }
  host { 'csc-wn03.saas.local':
    ensure       => present,
    ip           => '10.40.20.53',
    host_aliases => 'csc-wn03',
    target       => '/etc/hosts'
  }
  host { 'csc-wn04.saas.local':
    ensure       => present,
    ip           => '10.40.20.54',
    host_aliases => 'csc-wn04',
    target       => '/etc/hosts'
  }
  host { 'csc-wn05.saas.local':
    ensure       => present,
    ip           => '10.40.20.55',
    host_aliases => 'csc-wn05',
    target       => '/etc/hosts'
  }
  host { 'csc-wn06.saas.local':
    ensure       => present,
    ip           => '10.40.20.56',
    host_aliases => 'csc-wn06',
    target       => '/etc/hosts'
  }
  host { 'csc-wn07.saas.local':
    ensure       => present,
    ip           => '10.40.20.57',
    host_aliases => 'csc-wn07',
    target       => '/etc/hosts'
  }
  host { 'csc-wn08.saas.local':
    ensure       => present,
    ip           => '10.40.20.58',
    host_aliases => 'csc-wn08',
    target       => '/etc/hosts'
  }
  host { 'csc-wn09.saas.local':
    ensure       => present,
    ip           => '10.40.20.59',
    host_aliases => 'csc-wn09',
    target       => '/etc/hosts'
  }
  host { 'csc-wn10.saas.local':
    ensure       => present,
    ip           => '10.40.20.60',
    host_aliases => 'csc-wn10',
    target       => '/etc/hosts'
  }
  host { 'csc-wn11.saas.local':
    ensure       => present,
    ip           => '10.40.20.61',
    host_aliases => 'csc-wn11',
    target       => '/etc/hosts'
  }
  host { 'csc-wn12.saas.local':
    ensure       => present,
    ip           => '10.40.20.62',
    host_aliases => 'csc-wn12',
    target       => '/etc/hosts'
  }
  host { 'csc-wn13.saas.local':
    ensure       => present,
    ip           => '10.40.20.63',
    host_aliases => 'csc-wn13',
    target       => '/etc/hosts'
  }
  host { 'csc-wn14.saas.local':
    ensure       => present,
    ip           => '10.40.20.64',
    host_aliases => 'csc-wn14',
    target       => '/etc/hosts'
  }
  host { 'csc-wn15.saas.local':
    ensure       => present,
    ip           => '10.40.20.65',
    host_aliases => 'csc-wn15',
    target       => '/etc/hosts'
  }
  host { 'csc-wn16.saas.local':
    ensure       => present,
    ip           => '10.40.20.66',
    host_aliases => 'csc-wn16',
    target       => '/etc/hosts'
  }
  host { 'csc-wn17.saas.local':
    ensure       => present,
    ip           => '10.40.20.67',
    host_aliases => 'csc-wn17',
    target       => '/etc/hosts'
  }
  host { 'csc-wn18.saas.local':
    ensure       => present,
    ip           => '10.40.20.68',
    host_aliases => 'csc-wn18',
    target       => '/etc/hosts'
  }
  host { 'csc-wn19.saas.local':
    ensure       => present,
    ip           => '10.40.20.69',
    host_aliases => 'csc-wn19',
    target       => '/etc/hosts'
  }
  host { 'csc-wn20.saas.local':
    ensure       => present,
    ip           => '10.40.20.70',
    host_aliases => 'csc-wn20',
    target       => '/etc/hosts'
  }
  host { 'csc-wn21.saas.local':
    ensure       => present,
    ip           => '10.40.20.71',
    host_aliases => 'csc-wn21',
    target       => '/etc/hosts'
  }
  host { 'csc-wn22.saas.local':
    ensure       => present,
    ip           => '10.40.20.72',
    host_aliases => 'csc-wn22',
    target       => '/etc/hosts'
  }
  host { 'csc-wn23.saas.local':
    ensure       => present,
    ip           => '10.40.20.73',
    host_aliases => 'csc-wn23',
    target       => '/etc/hosts'
  }
  host { 'csc-wn24.saas.local':
    ensure       => present,
    ip           => '10.40.20.74',
    host_aliases => 'csc-wn24',
    target       => '/etc/hosts'
  }
  host { 'csc-wn25.saas.local':
    ensure       => present,
    ip           => '10.40.20.75',
    host_aliases => 'csc-wn25',
    target       => '/etc/hosts'
  }
  host { 'csc-wn26.saas.local':
    ensure       => present,
    ip           => '10.40.20.76',
    host_aliases => 'csc-wn26',
    target       => '/etc/hosts'
  }
  host { 'csc-wn27.saas.local':
    ensure       => present,
    ip           => '10.40.20.77',
    host_aliases => 'csc-wn27',
    target       => '/etc/hosts'
  }
  host { 'csc-wn28.saas.local':
    ensure       => present,
    ip           => '10.40.20.78',
    host_aliases => 'csc-wn28',
    target       => '/etc/hosts'
  }
  host { 'csc-wn29.saas.local':
    ensure       => present,
    ip           => '10.40.20.79',
    host_aliases => 'csc-wn29',
    target       => '/etc/hosts'
  }
  host { 'csc-wn30.saas.local':
    ensure       => present,
    ip           => '10.40.20.80',
    host_aliases => 'csc-wn30',
    target       => '/etc/hosts'
  }
  host { 'csc-wn31.saas.local':
    ensure       => present,
    ip           => '10.40.20.81',
    host_aliases => 'csc-wn31',
    target       => '/etc/hosts'
  }
  host { 'csc-wn32.saas.local':
    ensure       => present,
    ip           => '10.40.20.82',
    host_aliases => 'csc-wn32',
    target       => '/etc/hosts'
  }
  host { 'csc-wn33.saas.local':
    ensure       => present,
    ip           => '10.40.20.83',
    host_aliases => 'csc-wn33',
    target       => '/etc/hosts'
  }
  host { 'csc-wn34.saas.local':
    ensure       => present,
    ip           => '10.40.20.84',
    host_aliases => 'csc-wn34',
    target       => '/etc/hosts'
  }
  host { 'csc-wn35.saas.local':
    ensure       => present,
    ip           => '10.40.20.85',
    host_aliases => 'csc-wn35',
    target       => '/etc/hosts'
  }
  host { 'csc-wn36.saas.local':
    ensure       => present,
    ip           => '10.40.20.86',
    host_aliases => 'csc-wn36',
    target       => '/etc/hosts'
  }
  host { 'csc-wn37.saas.local':
    ensure       => present,
    ip           => '10.40.20.87',
    host_aliases => 'csc-wn37',
    target       => '/etc/hosts'
  }
  host { 'csc-wn38.saas.local':
    ensure       => present,
    ip           => '10.40.20.88',
    host_aliases => 'csc-wn38',
    target       => '/etc/hosts'
  }
  host { 'csc-jetty-0.saas.local':
    ensure       => present,
    ip           => '10.40.20.15',
    host_aliases => 'csc-jetty-0',
    target       => '/etc/hosts'
  }
  host { 'csc-jetty-1.saas.local':
    ensure       => present,
    ip           => '10.40.20.16',
    host_aliases => 'csc-jetty-1',
    target       => '/etc/hosts'
  }
  host { 'csc-jetty-2.saas.local':
    ensure       => present,
    ip           => '10.40.20.17',
    host_aliases => 'csc-jetty-2',
    target       => '/etc/hosts'
  }
  host { 'csc-portal-0.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.10',
    host_aliases => 'csc-portal-0',
    target       => '/etc/hosts'
  }
  host { 'csc-portal-1.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.11',
    host_aliases => 'csc-portal-1',
    target       => '/etc/hosts'
  }
  host { 'csc-portal-2.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.12',
    host_aliases => 'csc-portal-2',
    target       => '/etc/hosts'
  }
  host { 'csc-domain-0.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.20',
    host_aliases => 'csc-domain-0',
    target       => '/etc/hosts'
  }
  host { 'csc-domain-1.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.21',
    host_aliases => 'csc-domain-1',
    target       => '/etc/hosts'
  }
  host { 'csc-sql-0.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.25',
    host_aliases => 'csc-sql-0',
    target       => '/etc/hosts'
  }
  host { 'csc-sql-1.csc.saas.local':
    ensure       => present,
    ip           => '10.40.20.26',
    host_aliases => 'csc-sql-1',
    target       => '/etc/hosts'
  }
}
