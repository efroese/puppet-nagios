define nagios::service::nrpe::load (
  $ensure = 'present') {

  nagios::service { "nrpe-check_load":
    ensure => $ensure,
    host_name => $::fqdn,
    check_command => "check_nrpe!check_load",
    service_description => "CPU load check",
  }

  $pc = $::processorcount
  nrpe::command { "check_load":
      cmd => "/usr/lib64/nagios/plugins/check_load -w <%= pc * 3 %>,<%= pc * 2 %>,<%= pc * 2 %> -c <%= pc * 5 %>,<%= pc * 4 %>,<%= pc * 3 %>",
  }
      
}
