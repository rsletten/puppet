file { "/etc/nagios/nrpe.cfg":
  notify => Service["nrpe"],
  ensure => present,
  owner  => 'nagios',
  group  => 'nagios',
  mode   => 0600,
  source => "puppet:///files/nrpe.cfg"
}

file { "/usr/lib64/nagios/plugins/check_mem.sh":
  ensure => present,
  owner  => 'nagios',
  group  => 'nagios',
  mode   => 0755,
  source => "puppet:///files/check_mem.sh"
}

service { "nrpe":
  ensure => running,
  enable => true
}
