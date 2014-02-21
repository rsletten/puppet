import 'testnodes.pp'

node 'csc-mn00.saas.local' {
  include role::hadoop
}

node 'csc-mn01.saas.local' {
  include role::hadoop
}

node 'csc-mn02.saas.local' {
  include role::hadoop
}

node 'csc-wn00.saas.local' {
  include role::hadoop
}

node 'csc-wn01.saas.local' {
  include role::hadoop
}

node 'csc-wn02.saas.local' {
  include role::hadoop
}

node 'csc-wn03.saas.local' {
  include role::hadoop
}

node 'csc-wn04.saas.local' {
  include role::hadoop
}

node 'csc-wn05.saas.local' {
  include role::hadoop
}

node 'csc-wn06.saas.local' {
  include role::hadoop
}

node 'csc-wn07.saas.local' {
  include role::hadoop
}

node 'csc-wn08.saas.local' {
  include role::hadoop
}

node 'csc-wn09.saas.local' {
  include role::hadoop
}

node 'csc-wn10.saas.local' {
  include role::hadoop
}

node 'csc-wn11.saas.local' {
  include role::hadoop
}

node 'csc-wn12.saas.local' {
  include role::hadoop
}

node 'csc-wn13.saas.local' {
  include role::hadoop
}

node 'csc-wn14.saas.local' {
  include role::hadoop
}

node 'csc-wn15.saas.local' {
  include role::hadoop
}

node 'csc-wn16.saas.local' {
  include role::hadoop
}

node 'csc-wn17.saas.local' {
  include role::hadoop
}

node 'csc-wn18.saas.local' {
  include role::hadoop
}

node 'csc-wn19.saas.local' {
  include role::hadoop
}

node 'csc-wn20.saas.local' {
  include role::hadoop
}

node 'csc-wn21.saas.local' {
  include role::hadoop
}

node 'csc-wn22.saas.local' {
  include role::hadoop
}

node 'csc-wn23.saas.local' {
  include role::hadoop
}

node 'csc-wn24.saas.local' {
  include role::hadoop
}

node 'csc-wn25.saas.local' {
  include role::hadoop
}

node 'csc-wn26.saas.local' {
  include role::hadoop
}

node 'csc-wn27.saas.local' {
  include role::hadoop
}

node 'csc-wn28.saas.local' {
  include role::hadoop
}

node 'csc-wn29.saas.local' {
  include role::hadoop
}

node 'csc-wn30.saas.local' {
  include role::hadoop
}

node 'csc-wn31.saas.local' {
  include role::hadoop
}

node 'csc-wn32.saas.local' {
  include role::hadoop
}

node 'csc-wn33.saas.local' {
  include role::hadoop
}

node 'csc-wn34.saas.local' {
  include role::hadoop
}

node 'csc-wn35.saas.local' {
  include role::hadoop
}

node 'csc-wn36.saas.local' {
  include role::hadoop
}

node 'csc-wn37.saas.local' {
  include role::hadoop
}

node 'csc-wn38.saas.local' {
  include role::hadoop
}

node 'csc-sn03.saas.local' {
  include role::manager
}

node 'csc-jetty-0.saas.local' {
  include role::virtual
}

node 'csc-jetty-1.saas.local' {
  $falconwebservices = {
    node1 => { 'server' => '10.40.20.15', port => '8080' },
    node2 => { 'server' => '10.40.20.16', port => '8080' },
    node3 => { 'server' => '10.40.20.17', port => '8080' },
  }
  $balanceport = '8085'

  include role::virtual
  include jetty
  include nginx
}

node 'csc-jetty-2.saas.local' {
  include role::virtual
}

node 'stack0.saas.local' {
  include role::nonhadoop
  include profile::mtu9000
}

node 'stack1.saas.local' {
  include role::nonhadoop
  include profile::mtu9000
}

node 'csc-sn00' {
}
node 'csc-sn00.saas.local' {
}
node 'csc-sn01.saas.local' {
}
node 'csc-sn02.saas.local' {
}
