class ganglia::cron {
  cron  { "iostat_gmetric":
    command => "iostat -kdx 10 5 | /etc/ganglia/iostat_gmetric.pl  > /dev/null 2>&1",
    ensure  => present,
    user    => 'root',
    minute  => "*/1",
    require => Class["ganglia::package"],
  }
}
