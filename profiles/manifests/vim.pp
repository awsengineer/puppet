class profiles::vim {
  file {'/root/.vimrc':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => "644",
    source => 'puppet:///modules/profiles/vimrc',
  }

  file{'/root/.vim':
    ensure  => directory,
    require => Exec['puppet-syntax-vim']
  }

  exec{'puppet-syntax-vim':
    path    => "/usr/bin",
    command => "rm -fr /root/.vim; git clone https://github.com/puppetlabs/puppet-syntax-vim.git /root/.vim",
    require => [Package['git'],Service['proxy']],
    onlyif  => "test -z $(find /root/.vim/ | wc -l | grep 225)",
  }

  package {'git':
    ensure  => installed
  }
}
