class profiles::ntp inherits profiles::params {
    $ntp_package = $profiles::params::ntp_package
    $ntp_service = $profiles::params::ntp_service

    package {$ntp_package:
        ensure => installed,
    }
    file {'/etc/ntp.conf':
      ensure  => file,
      mode    => "644",
      owner   => root,
      group   => root,
      source  => 'puppet:///modules/profiles/ntp.conf',
      require => Package[$ntp_package]
    }
    service {$ntp_service:
      ensure    => running,
      enable    => true,
      subscribe =>  File['/etc/ntp.conf']
    }
}
