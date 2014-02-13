class jetty::service {
  service { 'jetty':
    ensure     => 'running',
    enable     => 'true',
    hasrestart => 'true',
    hasstatus  => 'true',
    require    => Class['jetty::package'],
  }
}
