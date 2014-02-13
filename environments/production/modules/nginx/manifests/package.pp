class nginx::package {
  package { 'nginx':
    ensure  => '1.5.10',
    require => Class['nginx::repo'],
  }
}
