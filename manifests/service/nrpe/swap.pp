define nagios::service::nrpe::swap (
  $ensure = 'present') {

  nagios::service { "nrpe-check_swap":
    ensure => $ensure,
    host_name => $::fqdn,
    check_command => 'check_nrpe!check_swap',
    service_description => "Swap check",
  }

  $pc = $::processorcount
  nrpe::command { "check_swap":
      cmd => inline_template("/usr/lib64/nagios/plugins/check_swap -w 98 -c 95"),
  }
      
}
