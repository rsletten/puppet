augeas { "ifcfg-bond0":
  context   => '/files/etc/sysconfig/network-scripts/ifcfg-bond0',
  changes => "set MTU '9000'",
}
