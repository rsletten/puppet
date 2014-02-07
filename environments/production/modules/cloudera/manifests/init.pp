# Class: cloudera
#
# This module manages cloudera
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class cloudera::agent {
  class { '::cloudera::agent::package': } ->
  class { '::cloudera::agent::config': } ->
  class { '::cloudera::agent::service': } ->
  Class['cloudera::agent']
}

class cloudera::manager {
  class { '::cloudera::manager::package': } ->
  class { '::cloudera::manager::service': } ->
  Class['cloudera::manager']
}

class hadoopgroups::virtual {
   @group { 'cloudera-scm':
    gid    => '1000',
    ensure => present
  }

  @group { 'hue':
    gid    => '1014',
    ensure => present
  }

  @group { 'hbase':
    gid    => '1001',
    ensure => present
  }

  @group { 'oozie':
    gid    => '1002',
    ensure => present
  }

  @group { 'sqoop2':
    gid    => '1003',
    ensure => present
  }

  @group { 'hive':
    gid    => '1004',
    ensure => present
  }

  @group { 'yarn':
    gid    => '1005',
    ensure => present
  }

  @group { 'sqoop':
    gid    => '1006',
    ensure => present
  }

  @group { 'mapred':
    gid    => '1007',
    ensure => present
  }

  @group { 'httpfs':
    gid    => '1008',
    ensure => present
  }

  @group { 'zookeeper':
    gid    => '1009',
    ensure => present
  }

  @group { 'hdfs':
    gid    => '1010',
    ensure => present
  }

  @group { 'flume':
    gid    => '1011',
    ensure => present
  }

  @group { 'impala':
    gid    => '1012',
    ensure => present,
  }

  @group { 'solr':
    gid    => '1013',
    ensure => present
  }

  @group { 'hadoop':
    gid     => '1015',
    ensure  => present,
  }
  @group { 'spark':
    gid     => '1016',
    ensure  => present,
  }
}

class hadoopusers::virtual {
  @user { 'cloudera-scm':
    uid        => '1000',
    gid        => '1000',
    shell      => '/sbin/nologin',
    home       => '/var/run/cloudera-scm-server',
    managehome => true,
    comment    => 'Cloudera Manager',
    ensure     => present
  }

  @user { 'hue':
    uid        => '1014',
    gid        => '1014',
    shell      => '/bin/false',
    home       => '/usr/share/hue',
    managehome => true,
    comment    => 'Hue',
    ensure     => present
  }

  @user { 'hbase':
    uid        => '1001',
    gid        => '1001',
    shell      => '/bin/false',
    home       => '/var/run/hue',
    managehome => true,
    comment    => 'HBase',
    ensure     => present
  }

  @user { 'oozie':
    uid        => '1002',
    gid        => '1002',
    shell      => '/sbin/nologin',
    home       => '/var/lib/oozie',
    managehome => true,
    comment    => 'Oozie',
    ensure     => present
  }

  @user { 'sqoop2':
    uid        => '1003',
    gid        => '1003',
    shell      => '/bin/false',
    home       => '/var/run/sqoop2',
    managehome => true,
    comment    => 'Sqoop 2 User',
    ensure     => present
  }

  @user { 'hive':
    uid        => '1004',
    gid        => '1004',
    shell      => '/bin/false',
    home       => '/var/lib/hive',
    managehome => true,
    comment    => 'Hive',
    ensure     => present
  }

  @user { 'yarn':
    uid        => '1005',
    gid        => '1005',
    shell      => '/bin/bash',
    home       => '/var/lib/hadoop-yarn',
    managehome => true,
    comment    => 'Hadoop Yarn',
    ensure     => present
  }

  @user { 'sqoop':
    uid        => '1006',
    gid        => '1006',
    shell      => '/bin/false',
    home       => '/var/lib/sqoop',
    managehome => true,
    comment    => 'Sqoop',
    ensure     => present
  }

  @user { 'mapred':
    uid        => '1007',
    gid        => '1007',
    shell      => '/bin/bash',
    home       => '/var/lib/hadoop-mapreduce',
    managehome => true,
    comment    => 'Hadoop MapReduce',
    ensure     => present,
    groups     => ['hadoop'],
  }

  @user { 'httpfs':
    uid        => '1008',
    gid        => '1008',
    shell      => '/bin/bash',
    home       => '/var/run/hadoop-httpfs',
    managehome => true,
    comment    => 'Hadoop HTTPFS',
    ensure     => present
  }

  @user { 'zookeeper':
    uid        => '1009',
    gid        => '1009',
    shell      => '/bin/false',
    home       => '/var/run/zookeeper',
    managehome => true,
    comment    => 'Zookeeper',
    ensure     => present
  }

  @user { 'hdfs':
    uid        => '1010',
    gid        => '1010',
    shell      => '/bin/bash',
    home       => '/var/lib/hadoop-hdfs',
    managehome => true,
    comment    => 'Hadoop HDFS',
    ensure     => present,
    groups     => ['hadoop'],
  }

  @user { 'flume':
    uid        => '1011',
    gid        => '1011',
    shell      => '/bin/false',
    home       => '/var/lib/flume-ng',
    managehome => true,
    comment    => 'Flume',
    ensure     => present
  }
  @user { 'impala':
    uid        => '1012',
    gid        => '1012',
    shell      => '/bin/bash',
    home       => '/var/run/impala',
    managehome => true,
    comment    => 'Impala',
    ensure     => present
  }
  @user { 'solr':
    uid        => '1013',
    gid        => '1013',
    shell      => '/sbin/nologin',
    home       => '/var/run/solr',
    managehome => true,
    comment    => 'Solr',
    ensure     => present
  }
  @user { 'spark':
    uid        => '1016',
    gid        => '1016',
    shell      => '/sbin/nologin',
    home       => '/var/lib/spark',
    managehome => true,
    comment    => 'Spark',
    ensure     => present
  }
}

class cloudera::hadoopaccounts {
  require hadoopgroups::virtual
  require hadoopusers::virtual
  realize(Group['cloudera-scm'])
  realize(Group['hue'])
  realize(Group['hbase'])
  realize(Group['oozie'])
  realize(Group['sqoop2'])
  realize(Group['hive'])
  realize(Group['yarn'])
  realize(Group['sqoop'])
  realize(Group['mapred'])
  realize(Group['httpfs'])
  realize(Group['zookeeper'])
  realize(Group['hdfs'])
  realize(Group['flume'])
  realize(Group['impala'])
  realize(Group['solr'])
  realize(Group['hadoop'])
  realize(Group['spark'])
  realize(User['cloudera-scm'])
  realize(User['hue'])
  realize(User['hbase'])
  realize(User['oozie'])
  realize(User['sqoop2'])
  realize(User['hive'])
  realize(User['yarn'])
  realize(User['sqoop'])
  realize(User['mapred'])
  realize(User['httpfs'])
  realize(User['zookeeper'])
  realize(User['hdfs'])
  realize(User['flume'])
  realize(User['impala'])
  realize(User['solr'])
  realize(User['spark'])
}
