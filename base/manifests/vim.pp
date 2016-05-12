class base::vim {
  file {'/root/.vimrc':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => "644",
    source => 'puppet:///modules/base/vimrc',
  }

  file{'/root/.vim':
    ensure  => directory,
    require => Exec['puppet-syntax-vim']
  }

  exec{'puppet-syntax-vim':
    command => "/usr/bin/rm -fr ~/.vim ; /usr/bin/git clone https://github.com/puppetlabs/puppet-syntax-vim.git ~/.vim",
    require => [Package['git'],Service['proxy']]
  }

  package {'git':
    ensure => installed
  }
}
