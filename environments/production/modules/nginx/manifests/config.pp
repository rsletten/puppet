class nginx::config {
  file { '/etc/nginx/nginx.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/nginx.conf.erb'),
    require => Class['nginx::package'],
    notify  => Class['nginx::service'],
  }
}
