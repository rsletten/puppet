file { "/data0":
  ensure => directory,
  mode   => 0755,
  owner  => "root",
  group  => "root",
}
