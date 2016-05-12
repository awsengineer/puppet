class ssh {
  include ssh::params
  $sshservice=$ssh::params::sshservice
  notify {"SSH service is: $sshservice":}
  service {'ssh service':
    name => $sshservice,
    ensure => running,
    enable => true,
  }
}
