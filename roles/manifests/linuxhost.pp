class roles::linuxhost {
  include profiles::vim
  include profiles::proxy
  include profiles::config
  include profiles::yum
  include profiles::ntp
}
