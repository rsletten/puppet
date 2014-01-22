class cloudera::manager::package {
  require cloudera::hadoopaccounts

  package { "cloudera-manager-server":
    ensure => present,
  }
  package { "cloudera-manager-server-db":
    ensure => present,
  }
  package { "cloudera-manager-agent":
    ensure => present,
  }
  package { "cloudera-manager-daemons":
    ensure => present,
  }
}

class cloudera::manager::service {
  service { "cloudera-scm-server-db":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class["cloudera::manager::package"],
  }

  service { "cloudera-scm-server":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Service["cloudera-scm-server-db"], 
  }
}
