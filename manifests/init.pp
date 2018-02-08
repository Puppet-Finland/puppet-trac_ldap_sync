#
# == Class trac_ldap_sync
#
# This class takes care of syncing Trac user accounts with LDAP.
#
class trac_ldap_sync
(
    String                  $db_name,
    String                  $db_user_name,
    String                  $db_user_password,
    String                  $ldap_host,
    Variant[Integer,String] $ldap_port,
    String                  $ldap_binddn,
    String                  $ldap_bindpw,
    String                  $ldap_user_basedn,
    String                  $source_email,
    String                  $target_email,
    Variant[Integer,String] $hour,
    Variant[Integer,String] $minute

) inherits trac_ldap_sync::params
{
    $install_dir = '/opt/trac-ldap-sync'

    include ::python::psycopg2
    include ::python::ldap

    vcsrepo { $install_dir:
        ensure   => 'latest',
        source   => 'https://github.com/mattock/trac-ldap-sync.git',
        provider => 'git',
    }

    file { '/etc/trac-ldap-sync.conf':
        ensure  => 'present',
        content => template('trac_ldap_sync/trac-ldap-sync.conf.erb'),
        owner   => 'root',
        group   => 'root',
        mode    => '0600',
    }

    cron { 'trac-ldap-sync':
        command => "cd ${install_dir} && python ${install_dir}/ldapsync.py",
        user    => root,
        hour    => $hour,
        minute  => $minute,
    }
}
