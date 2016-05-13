class profiles::apache {
    include profiles::apache::config
    include profiles::apache::package
    include profiles::apache::service
    include profiles::apache::params
}
