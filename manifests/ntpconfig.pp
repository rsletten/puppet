class { '::ntp':
  servers  => [ '10.40.20.43' ],
  restrict => ['127.0.0.1'],
}
