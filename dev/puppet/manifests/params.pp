#
# Tweak these variables to adjust your development environment:
#
class params {
    # Hostname of the virtualbox (make sure this URL points to 127.0.0.1 on your local dev system!)
    $host = 'workshop.pfz.nl'
    $docroot = '/vagrant/public/'
    $port = '80'

    # Database information.
    $dbname = 'workshop'
    $dbuser = 'workshop'
    $dbpass = ''

    $filepath = '/vagrant/puppet/modules'
}
