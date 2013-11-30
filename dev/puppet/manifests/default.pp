# Set default path for Exec calls
import "params.pp"

Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/zend/bin/' ]
}

node default {
    include params
    include workshop
}
