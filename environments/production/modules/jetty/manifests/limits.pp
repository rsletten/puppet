class jetty::limits {
  limits::limits { 'cscprod_nofile':
    ensure     => 'present',
    user       => 'cscprod',
    limit_type => 'nofile',
    both       => '32768'
  }
  limits::limits { 'cscprod_nproc':
    ensure     => 'present',
    user       => 'cscprod',
    limit_type => 'nproc',
    both       => '32768'
  }
}
