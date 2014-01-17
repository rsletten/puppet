class ganglia::service {
  service { "gmond":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class["ganglia::config"],
  }
}
