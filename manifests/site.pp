node 'hadoop' {
  include cloudera::hadoopaccounts
  include ganglia
  import 'hadooplimits.pp'
  import 'hadoopsysctl.pp'
  import 'ntpconfig.pp'
  import 'cups.pp'
  import 'nrpe.pp'
  import 'sshkey.pp'
  import 'hostsfile.pp'
}

node 'common' {
  import 'ntpconfig.pp'
  import 'cups.pp'
  import 'nrpe.pp'
  import 'sshkey.pp'
  import 'hostsfile.pp'
}

node 'csc-mn00.saas.local' inherits hadoop {
}

node 'csc-mn01.saas.local' inherits hadoop {
}

node 'csc-mn02.saas.local' inherits hadoop {
}

#
node 'csc-wn00.saas.local' inherits hadoop {
}

node 'csc-wn01.saas.local' inherits hadoop {
}

node 'csc-wn02.saas.local' inherits hadoop {
}

node 'csc-wn03.saas.local' inherits hadoop {
}

node 'csc-wn04.saas.local' inherits hadoop {
}

node 'csc-wn05.saas.local' inherits hadoop {
}

node 'csc-wn06.saas.local' inherits hadoop {
}

node 'csc-wn07.saas.local' inherits hadoop {
}

node 'csc-wn08.saas.local' inherits hadoop {
}

node 'csc-wn09.saas.local' inherits hadoop {
}

node 'csc-wn10.saas.local' inherits hadoop {
}

node 'csc-wn11.saas.local' inherits hadoop {
}

node 'csc-wn12.saas.local' inherits hadoop {
}

node 'csc-wn13.saas.local' inherits hadoop {
}

node 'csc-wn14.saas.local' inherits hadoop {
}

node 'csc-wn15.saas.local' inherits hadoop {
}

node 'csc-wn16.saas.local' inherits hadoop {
}

node 'csc-wn17.saas.local' inherits hadoop {
}

node 'csc-wn18.saas.local' inherits hadoop {
}

node 'csc-wn19.saas.local' inherits hadoop {
}

node 'csc-wn20.saas.local' inherits hadoop {
}

node 'csc-wn21.saas.local' inherits hadoop {
}

node 'csc-wn22.saas.local' inherits hadoop {
}

node 'csc-wn23.saas.local' inherits hadoop {
}

node 'csc-wn24.saas.local' inherits hadoop {
}

node 'csc-wn25.saas.local' inherits hadoop {
}

node 'csc-wn26.saas.local' inherits hadoop {
}

node 'csc-wn27.saas.local' inherits hadoop {
}

node 'csc-wn28.saas.local' inherits hadoop {
}

node 'csc-wn29.saas.local' inherits hadoop {
}

node 'csc-wn30.saas.local' inherits hadoop {
}

node 'csc-wn31.saas.local' inherits hadoop {
}

node 'csc-wn32.saas.local' inherits hadoop {
}

node 'csc-wn33.saas.local' inherits hadoop {
}

node 'csc-wn34.saas.local' inherits hadoop {
}

node 'csc-wn35.saas.local' inherits hadoop {
}

node 'csc-wn36.saas.local' inherits hadoop {
}

node 'csc-wn37.saas.local' inherits hadoop {
}

node 'csc-wn38.saas.local' inherits hadoop {
}

node 'csc-sn03.saas.local' {
  include ganglia::manager
}

# $interval = 3+fqdn_rand(2)
# cron {"puppet-agent":
#    command => "/usr/bin/puppet agent --onetime --no-daemonize --splay --logdest syslog > /dev/null 2>&1",
#    ensure  => present,
#    user    => root,
#    minute  => "*/$interval"
#}
#
# service {'puppet':
#    ensure  => stopped,
#    require => Cron["puppet-agent"]
#