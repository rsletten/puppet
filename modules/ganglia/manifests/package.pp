class ganglia::package {
  package { "ganglia-gmond":
    ensure => present,
  }

  package { "sysstat":
    ensure => present,
  }
}
