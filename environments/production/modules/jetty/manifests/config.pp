class jetty::config {
  $dbserver = hiera('tenant_registry_dbserver')
  $dbport = hiera('tenant_registry_dbport')
  $dbtype = hiera('tenant_registry_dbyype')
  $dbschema = hiera('tenant_registry_schema')
  $dbdriver = hiera('tenant_registry_driver')
  $dbuser = hiera('tenant_registry_user')
  $dbpass = hiera('tenant_registry_pass')
  file { '/webservices/jetty/resources/dbsettings.properties':
    ensure  => 'present',
    owner   => 'cscprod',
    group   => 'cscprod',
    mode    => '0644',
    content => template('jetty/dbsettings.properties.erb'),
    require => Class['jetty::package'],
  }
}
