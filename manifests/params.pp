# Class: stunnel::params
#
# This class defines default parameters used by the main module class stunnel
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to stunnel class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class stunnel::params {

  ### Module specific parameters
  $init_enabled = '1'
  $init_options = ''
  $init_files = '/etc/stunnel/*.conf'
  $init_ppp_restart = '0'
  $pem_file_source = ''
  $pem_file = $::operatingsystem ? {
    default => '/etc/ssl/certs/stunnel.pem',
  }
  $pem_file_mode = $::operatingsystem ? {
    default => '0600',
  }

  $pem_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $pem_file_group = $::operatingsystem ? {
    default => 'root',
  }

  ### Application related parameters
  $package = $::operatingsystem ? {
    default => 'stunnel',
  }

  $service = $::operatingsystem ? {
    default => 'stunnel4',
  }

  $service_status = $::operatingsystem ? {
    default => false,
  }

  $process = $::operatingsystem ? {
    default => 'stunnel4',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'stunnel4',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/stunnel',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/stunnel/stunnel.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    default => '/etc/default/stunnel4',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/stunnel4/stunnel.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/stunnel',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/stunnel4',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/stunnel4/stunnel.log',
  }

  $port = '42'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = true
  $template = ''
  $init_template = 'stunnel/init-conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
