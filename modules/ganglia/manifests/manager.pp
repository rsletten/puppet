class ganglia::manager {
  include ganglia::manager::packages
  include ganglia::manager::service
  
  cron  { "ganglia-memory2permanent":
    command => "[ -f /var/lock/subsys/gmetad ] && /usr/local/sbin/ganglia-memory2permanent > /dev/null 2>&1",
    ensure  => present,
    user    => 'root',
    minute  => "*/10",
  }

  file { "/etc/ganglia/gmetad.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    notify  => Class['ganglia::manager::service'],
    source  => "puppet:///modules/ganglia/gmetad.conf",
  }

  file { "ganglia-memory2permanent":
    path    => '/usr/local/sbin/ganglia-memory2permanent',
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    source  => "puppet:///modules/ganglia/ganglia-memory2permanent",
  } 

  file { "ganglia-permanent2memory":
    path    => '/usr/local/sbin/ganglia-permanent2memory',
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    source  => "puppet:///modules/ganglia/ganglia-permanent2memory",
  } 

}

class ganglia::manager::service {
  service { "gmetad":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['ganglia::manager::packages'],
  }
}

class ganglia::manager::packages {
  package { 'httpd':
    ensure => present
  }
  package { 'ganglia':
    ensure => present
  }
  package { 'ganglia-gmond':
    ensure => present
  }
  package { 'ganglia-gmetad':
    ensure => present
  }
  package { 'ganglia-web':
    ensure => present
  }
}
