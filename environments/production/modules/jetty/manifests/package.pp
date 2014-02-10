class jetty::package {
  package { 'jetty-distribution':
    ensure => 'installed',
    require => Class['jetty::repo', 'jetty::user' ], 
  }
}
