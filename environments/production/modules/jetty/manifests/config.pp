class jetty::config {
  $dbserver = hiera('tenant.registry.dbServer')
  $dbport = hiera('tenant.registry.dbPort')
  $dbtype = hiera('tenant.registry.dbType')
  $dbschema = hiera('tenant.registry.schema')
  $dbdriver = hiera('tenant.registry.driver')
  $dbuser = hiera('tenant.registry.user')
  $dbpass = hiera('tenant.registry.pass')
  file { '/webservices/jetty/resources/dbsettings.properties':
    ensure  => 'present',
    owner   => 'cscprod',
    group   => 'cscprod',
    mode    => '0644',
    content => template('jetty/dbsettings.properties.erb'),
    require => Class['jetty::package'],
  }
}
