class jetty::config {
  $dbserver = hiera('tenant_registry_dbserver')
  $dbport = hiera('tenant_registry_dbport')
  $dbtype = hiera('tenant_registry_dbtype')
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
    notify  => Class['jetty::service'],
  }

  file { '/etc/default/jetty':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/jetty/jetty',
    require => Class['jetty::package'],
    notify  => Class['jetty::service'],
  }

  file { '/etc/rc.d/init.d/jetty':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/jetty/jetty.sh',
    require => Class['jetty::package'],
  }

  #  file { '/webservices/jetty/etc/jetty-jmx.xml':
  #  ensure  => 'present',
  #  owner   => 'cscprod',
  #  group   => 'cscprod',
  #  mode    => '0644',
  #  source  => 'puppet:///modules/jetty/jetty-jmx.xml',
  #  require => Class['jetty::package'],
  #}

}
