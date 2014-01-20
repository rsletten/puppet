class cloudera::agent {

  class cloudera::agent::service {
    service { "cloudera-scm-agent":
      ensure     => running,
      hasstatus  => true,
      hasrestart => true,
      enable     => true,
      require    => Class["cloudera::agent::package"],
    }
  }

  class cloudera::agent::config {
    file { "/etc/cloudera-scm-agent/config.ini":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => 0644,
      source  => "puppet:///modules/cloudera/config.ini",
      require => Class["cloudera::agent::package"],
      notify  => Class["cloudera::agent::service"],
    }
  }

  class cloudera::agent::package {
    package { "cloudera-manager-agent":
      ensure => present,
    }
  }
}