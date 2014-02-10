class jetty::repo {
  yumrepo { 'jetty-distribution':
    enabled  => '1',
    baseurl  => 'http://10.40.20.43:8080/jettyrepo/',
    descr    => 'Camstar Jetty Repo',
    gpgcheck => '0',
  }
}
