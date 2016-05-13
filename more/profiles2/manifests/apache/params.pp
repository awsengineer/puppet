class profiles::apache::params {
    case $::osfamily {
  	    'RedHat': { 
            $apache_service    = 'httpd' 
            $apache_package    = 'httpd' 
            $apache_config_dir = '/etc/httpd/conf'
            $apache_document_root = '/var/www/docrootkiri3'
        } 
  	    'Debiani' :{ 
            $apache_service    = 'apache2' 
            $apache_package    = 'apache2' 
            $apache_config_dir = '/etc/httpd/conf'
            $apache_document_root = '/var/www/docroot'
        }
	    default: { 
            alert  {"Operating system $::osfamily is not currently supported": }
        }
    }
}
