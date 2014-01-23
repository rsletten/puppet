class ganglia::config {
  $csc = hiera('csc')
  $role = $csc[$::clientcert]['role']
  file { "/etc/ganglia/gmond.conf":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('ganglia/gmond.conf.erb'), 
    require => Class["ganglia::package"],
    notify  => Class["ganglia::service"],
  }
  file { "/etc/ganglia/iostat_gmetric.pl":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0755,
    source  => "puppet:///modules/ganglia/iostat_gmetric.pl",
    require => Class["ganglia::package"],
    notify  => Class["ganglia::service"],
  } 
}
