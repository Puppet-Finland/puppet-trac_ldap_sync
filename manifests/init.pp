#
# == Class trac_ldap_sync
#
# This class takes care of syncing Trac user accounts with LDAP.
#
class trac_ldap_sync
(
    $hour,
    $minute
)
{

    cron { 'trac-ldap-sync':
        command => 'cd /root/trac-ldap-sync && python /root/trac-ldap-sync/ldapsync.py',
        user    => root,
        hour    => $hour,
        minute  => $minute,
    }
}
