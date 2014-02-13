class nginx::service {
  service { 'nginx':
    ensure    => 'running',
    hasstatus => 'true',
    harestart => 'true',
    enable    => 'true',
    require   => Class['nginx::package'],
  }
}

