class nginx::package {
  package { 'nginx':
    ensure  => '1.5.10-1-el6.ngx',
    require => Class['nginx::repo'],
  }
}
