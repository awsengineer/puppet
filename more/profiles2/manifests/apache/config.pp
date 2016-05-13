class profiles::apache::config (
    $apache_service       = $profiles::apache::params::apache_service,
    $apache_package       = $profiles::apache::params::apache_package,
    $apache_config_dir    = $profiles::apache::params::apache_config_dir,
    $apache_document_root = $profiles::apache::params::apache_document_root

) inherits profiles::apache::params {
    
    notify {"1111111111 $apache_document_root 22222222222": }
    file {$apache_config_dir:
        ensure => directory,
        mode   => "755",
        owner  => root,
        group  => root,
    }

    file {$apache_document_root:
        ensure => directory,
        mode   => "755",
        owner  => root,
        group  => root,
    }

    file {'apache_config_file':
        path   => "${apache_config_dir}/httpd.conf",
        ensure  => file,
        content => template('profiles/apache/httpd.conf.erb'),
        mode    => "755",
        owner   => root,
        group   => root,
        require => [Package[$apache_package], File[$apache_config_dir], File[$apache_document_root]],
    }

	file {'index.html':
        path    => "${apache_document_root}/index.html",
        ensure  => file,
        source  => 'puppet:///modules/profiles/apache/index.html',
        mode    => "755",
        owner   => root,
        group   => root,
        require => File[$apache_document_root],
    }

}
