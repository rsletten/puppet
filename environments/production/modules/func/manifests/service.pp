class func::service {
  service { "funcd":
    ensure     => 'running',
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class["func::package"],
  }
}
