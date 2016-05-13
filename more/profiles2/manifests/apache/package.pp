class profiles::apache::package(
    $apache_package = $profiles::apache::params::apache_package 

) inherits profiles::apache::params {
    package {$apache_package:
        ensure => installed,
    }
}
