class base::profile {
  file {'/etc/profile':
    ensure => file,
    mode   => "755",
    owner  => root,
    group  => root,
    source => 'puppet:///modules/base/etcprofile',
  }
}
