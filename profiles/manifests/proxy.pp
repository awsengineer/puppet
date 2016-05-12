class profiles::proxy {
  $proxy_config_file='/etc/cntlm.conf'
  $proxy_package = 'cntlm'

  package {"$proxy_package":
    ensure => installed,
  }
  file {"$proxy_config_file":
    ensure  => file,
    mode    => "600",
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/profiles/proxy.conf',
    require => Package["$proxy_package"],
  }
  service {'proxy':
    name      => 'cntlm',
    ensure    => running,
    enable    => true,
    subscribe => File["$proxy_config_file"],
  }
}
