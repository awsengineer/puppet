class ssh::params {
  case $::osfamily {
    "Redhat": { $sshservice="sshd" }
    default:  { notify {"OS is not supported!": } }
  }
}
