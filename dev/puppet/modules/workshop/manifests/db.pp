class workshop::db {

    class { "mysql":
        root_password   => $::params::root_password,
        absent          => false,
    }

    notify { "Creating database.":
    }

    ->

    mysql::grant { "workshop":
        mysql_db        => $::params::dbname,
        mysql_user      => $::params::dbuser,
        mysql_password  => $::params::dbpass
    }

    mysql::queryfile { "create-structure":
        mysql_file      => "/vagrant/dev/database/structure.sql",
        mysql_db        => $::params::dbname,
        require         => Mysql::Grant['workshop'],
    }

}