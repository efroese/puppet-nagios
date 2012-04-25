define nagios::service::nrpe::disk (
  $ensure = 'present',
  $warn_pct = 25,
  $crit_pct = 20,
  $fs = [ '/' ]
) {

  nagios::service { "nrpe-check_disk":
    ensure => $ensure,
    host_name => $::fqdn,
    check_command => 'check_nrpe!check_disk',
    service_description => "Disk check",
  }

  $pc = $::processorcount
  nrpe::command { "check_disk":
      cmd => inline_template("/usr/lib64/nagios/plugins/check_disk -l -w <%= warn_pct %>% -c <%= crit_pct %>% <% fs.each do |f| -%> -p <%= f %><% end -%>") 
  }
      
}
