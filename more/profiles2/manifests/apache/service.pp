class profiles::apache::service(
    $apache_service = $profiles::apache::params::apache_service,
    $apache_package = $profiles::apache::params::apache_package 

) inherits profiles::apache::params {
    service {$apache_service:
        ensure    => running,
        enable    => true,
        require   => Package[$apache_package],
        subscribe => File['apache_config_file'],
    }
}
