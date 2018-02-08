# puppet-trac_ldap_sync

A Puppet module for setting up 
[trac-ldap-sync](https://github.com/mattock/trac-ldap-sync) script.

# Module usage

This class takes a bunch of parameters related to LDAP, PostgreSQL and SMTP. 
Please refer to the [main class](manifests/init.pp) for a list.

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has only been tested on Ubuntu 16.04. That said, it should work on 
most Debian and RedHat derivatives out of the box.

For details see [params.pp](manifests/params.pp).
