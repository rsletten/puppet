class cloudera::manager::package {
  require Class['cloudera::hadoopaccounts'],
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
  package { "jdk":
    ensure => present,
  }
}
