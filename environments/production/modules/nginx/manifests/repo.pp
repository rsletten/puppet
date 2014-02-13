class ngix::repo {
  yumrepo { 'nginx':
    enabled  => '1',
    baseurl  => 'http://nginx.org/packages/mainline/centos/6/$basearch/',
    descr    => 'NGINX Repo',
    gpgcheck => '0',
  }
}
