class func::config {
  $funcserver = hiera('puppetmaster')

  file { '/etc/certmaster/minion.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('func/minion.conf.erb'),
    require => Class["func::package"],
    notify  => Class["func::service"],
  }
}
