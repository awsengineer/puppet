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
    path => '/usr/bin',
    command => 'rm -fr /root/.vim*; git clone https://github.com/puppetlabs/puppet-syntax-vim.git /root/.vim; wget https://raw.githubusercontent.com/awsengineer/puppet/master/base/files/vimrc -O /root/.vimrc',
    require => [Package['git']],
    onlyif  => "test -z $(find /root/.vim/ | wc -l | grep 225)",
  }


  package {['git','gem']:
    ensure => installed,
  }

  package {'puppet-lint':
    ensure   => installed,
    provider => gem,
    require  => Package['gem']
  }

}
