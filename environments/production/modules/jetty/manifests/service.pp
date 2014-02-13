class jetty::service {
  service { 'jetty':
    ensure     => 'running',
    enabled    => 'true',
    hasrestart => 'true',
    hasstatus  => 'true',
    requires   => Class['jetty::package'],
  }
}
