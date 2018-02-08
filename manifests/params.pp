#
# == Class: trac_ldap_sync::params
#
# Defines some variables based on the operating system
#
class trac_ldap_sync::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            # Nothing here yet
        }
        'Debian': {
            # Nothing here yet
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
