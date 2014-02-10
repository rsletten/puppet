class jetty::tuning {
  sysctl { 'net.core.rmem_max':
    value => '16777216'
  }
  sysctl { 'net.core.wmem_max':
    value => '16777216'
  }
  sysctl { 'net.ipv4.tcp_rmem':
    value => "4096\t87380\t16777216"
  }
  sysctl { 'net.ipv4.tcp_wmem':
    value => "4096\t16384\t16777216"
  }
  sysctl { 'net.core.netdev_max_backlog':
    value => '16384'
  }
  sysctl { 'net.ipv4.tcp_max_syn_backlog':
    value => '8192'
  }
  sysctl { 'net.core.somaxconn':
    value => '4096'
  }
  sysctl { 'net.ipv4.ip_local_port_range':
    value => "1024\t65535"
  }
  sysctl { 'net.ipv4.tcp_tw_recycle':
    value => '1'
  }
}
