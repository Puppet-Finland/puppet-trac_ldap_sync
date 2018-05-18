# puppet-trac_ldap_sync

A Puppet module for setting up 
[trac-ldap-sync](https://github.com/mattock/trac-ldap-sync) script which syncs
emails from LDAP to the Trac database. The current version of that script is
known to work on Trac 1.2.

# Module usage

This class takes a bunch of parameters related to LDAP, PostgreSQL and SMTP:

    class { '::trac_ldap_sync':
        hour              => 5,
        minute            => 15,
        db_name           => 'trac',
        db_user_name      => 'tracuser',
        db_user_password  => 'secret',
        ldap_host         => 'ldap.example.org',
        ldap_port         => 389,
        ldap_binddn       => 'cn=proxy,dc=example,dc=org',
        ldap_bindpw       => 'secret',
        ldap_user_basedn  => 'ou=People,dc=example,dc=org',
        source_email      => 'trac@example.org',
        target_email      => 'monitor@example.org',
    }

Please refer to the [main class](manifests/init.pp) for more details.

