class workshop::setup {

    $default_packages = [ 'screen', 'vim', 'git', 'make', 'curl', 'unzip', 'zip' ]

    package { $default_packages:
        ensure => present,
    }

    user {  "berry":
        ensure => present,
    }

    file { "/var/log/my-application.log":
        ensure => 'present',
        owner => "berry",
        group => "berry",
        require => User['berry'],
    }

    exec { "touch /tmp/touch-test":
        unless => 'test -f /tmp/touch-test',
    }

}