class workshop::web {

    class { "apache":
        port => $::params::port,
    }

    apache::vhost { "default":
        docroot     => $::params::docroot,
        server_name => $::params::host,
        port        => $::params::port,
        priority    => '',
    }

    # Parse the PHP version.
    if $phpversion == undef {
      $phpversion = 'latest'
    }

    class { "php":
      version => $phpversion,
    }
}