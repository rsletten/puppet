limits::limits { 'hdfs_nofile':
      ensure     => present,
      user       => 'hdfs',
      limit_type => 'nofile',
      both       => 32768,
    }

limits::limits { 'hbase_nofile':
      ensure     => present,
      user       => 'hbase',
      limit_type => 'nofile',
      both       => 32768,
    }

limits::limits { 'hdfs_noproc':
      ensure     => present,
      user       => 'hdfs',
      limit_type => 'nproc',
      both       => 32768,
    }

limits::limits { 'hbase_noproc':
      ensure     => present,
      user       => 'hbase',
      limit_type => 'nproc',
      both       => 32768,
    }

limits::limits { 'root_nofile':
      ensure     => present,
      user       => 'root',
      limit_type => 'nofile',
      both       => 32768,
    }
