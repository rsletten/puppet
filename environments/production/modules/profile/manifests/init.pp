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

class profile::gituser {
  group { 'git':
    ensure => present,
    gid    => '3001',
  }
  user { 'git':
    ensure     => present,
    uid        => '3001',
    gid        => '3001',
    home       => '/git',
    managehome => true,
    comment    => 'Git User',
  }

  ssh_authorized_key { 'git':
    user   => "git",
    ensure => present,
    type   => "ssh-rsa",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDLoNDo+HkY+nEQ5jd89NtJxdp6B/fjNMoKuxV+1ovtdrjmGp7CYYe39GwvMqTFi3vxjL+uWJYbIEkPdidbN/IdmSeNyGIILCVSe8PUAgJF2nWofiWsBvflHHWdow3vhIF/k+WBRO39vaq86Qln7I19qtI2QnPzgLgNW0uuUEyIjeKpIvDy33gajGWQoOyTh4ACibsgu8yf+YTgykIq+a0xDf/O6rngQsdbiXZdbm8j8sx81p9q3vVo/2wk2qywiYdx24X5aEedSnQqT6U/cbhLHHq0LM+ZvMvDCfOY4dsraRucj8rg1GxSRn9XezEuv3njd0HK8uoREWP8ch6M2+gN",
    name   => "git",
  }
}

class profile::rootsshkey {
  ssh_authorized_key { 'root':
    user   => "root",
    ensure => present,
    type   => "ssh-rsa",
    key    => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDLoNDo+HkY+nEQ5jd89NtJxdp6B/fjNMoKuxV+1ovtdrjmGp7CYYe39GwvMqTFi3vxjL+uWJYbIEkPdidbN/IdmSeNyGIILCVSe8PUAgJF2nWofiWsBvflHHWdow3vhIF/k+WBRO39vaq86Qln7I19qtI2QnPzgLgNW0uuUEyIjeKpIvDy33gajGWQoOyTh4ACibsgu8yf+YTgykIq+a0xDf/O6rngQsdbiXZdbm8j8sx81p9q3vVo/2wk2qywiYdx24X5aEedSnQqT6U/cbhLHHq0LM+ZvMvDCfOY4dsraRucj8rg1GxSRn9XezEuv3njd0HK8uoREWP8ch6M2+gN",
    name   => "root",
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

class profile::mcollective-server {
  class { '::mcollective':
    client             => true,
    middleware         => true,
    middleware_hosts   => [ 'csc-sn03.saas.local'],
    middleware_ssl     => true,
    securityprovider   => 'ssl',
    ssl_client_certs   => 'puppet:///modules/site_mcollective/client_certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/csc-sn03.saas.local.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/csc-sn03.saas.local.pem',
  }

  mcollective::user { 'rsletten':
    certificate => 'puppet:///modules/site_mcollective/client_certs/rsletten.pem',
    private_key => 'puppet:///modules/site_mcollective/private_keys/rsletten.pem',
    homedir     => '/home/rsletten',
  }

  mcollective::plugin { 'puppet':
    package => true,
  }

}

class profile::mcollective-client {
  class { '::mcollective':
    middleware_hosts   => [ 'cobbler.camstar.local'],
    middleware_ssl     => true,
    securityprovider   => 'ssl',
    ssl_client_certs   => 'puppet:///modules/site_mcollective/client_certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/cobbler.camstar.local.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/cobbler.camstar.local.pem',
  }

  mcollective::plugin { 'puppet':
    package => true,
  }

}

