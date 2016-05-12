class profiles::yum {

  Package {
    require => File['/etc/yum.repos.d/CentOS-Base.repo'],
  }

  file {'/etc/yum.repos.d/CentOS-Base.repo':
    ensure  => file,
    mode    => "644",
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/profiles/CentOS-Base.repo',
    require => Service['cntlm']
  }
}
