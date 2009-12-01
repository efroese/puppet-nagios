class nagios::debian inherits nagios::base {

    Package['nagios'] { name => 'nagios3' }

    package { [ 'nagios-plugins', 'nagios-snmp-plugins','nagios-nrpe-plugin' ]:
        ensure => 'present',
        notify => Service['nagios'],
    }

    Service['nagios'] {
        name => 'nagios3',
        hasstatus => true,
    }
}
