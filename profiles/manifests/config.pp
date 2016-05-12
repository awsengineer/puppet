class profiles::config {
  file {'/etc/profile':
    ensure => file,
    mode   => "755",
    owner  => root,
    group  => root,
    source => 'puppet:///modules/profiles/etcprofile',
  }
}
