class cloudera::agent::service {
  service { "cloudera-scm-agent":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

class cloudera::agent::config {
  $manager = hiera('clouderamanager')
  file { "/etc/cloudera-scm-agent/config.ini":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('cloudera/config.ini.erb'),
    notify  => Class["cloudera::agent::service"],
    require => Class["cloudera::agent::package"],
  }
}

class cloudera::agent::package {
  package { "cloudera-manager-agent":
    ensure => present,
  }
  package { "cloudera-manager-daemons":
    ensure => present,
  }
  package { "jdk":
    ensure => present,
  }
}
