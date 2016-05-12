class profiles::params {
  case $osfamily {
    'RedHat': {
      $ntp_package = 'ntp'
      $ntp_service = 'ntpd'
     }
    'Debian': {
      $ntp_package = 'ntp'
      $ntp_service = 'ntpd'
     }
     #default: { 
     # fail{"OS $operatingsystem not supported":}
     #}
  }
}
