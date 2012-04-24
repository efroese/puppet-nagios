define nagios::service::nrpe::load (
  $ensure = 'present') {

  nagios::service { "nrpe-check_load":
    ensure => $ensure,
    host_name => $::fqdn,
    check_command => 'check_nrpe!check_load',
    service_description => "CPU load check",
  }

  $pc = $::processorcount
  nrpe::command { "check_load":
      cmd => inline_template("/usr/lib64/nagios/plugins/check_load -w <%= Integer(pc) * 3 %>,<%= Integer(pc) * 2 %>,<%= Integer(pc) * 2 %> -c <%= Integer(pc) * 5 %>,<%= Integer(pc) * 4 %>,<%= Integer(pc) * 3 %>"),
  }
      
}
