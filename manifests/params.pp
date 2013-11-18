# Class: network::params
#
# Defines all the variables used in the module.
#
class network::params {

  $package_name = ''

  $service_name = $::osfamily ? {
    'Debian' => 'networking',
    default  => 'network',
  }

  $config_file_path = $::osfamily ? {
    'Debian' => '/etc/network/interfaces',
    'RedHat' => '/etc/sysconfig/network-scripts/ifcfg-eth0',
  }

  $config_file_mode = $::osfamily ? {
    default => '0644',
  }

  $config_file_owner = $::osfamily ? {
    default => 'root',
  }

  $config_file_group = $::osfamily ? {
    default => 'root',
  }

  $config_dir_path = $::osfamily ? {
    'Debian' => '/etc/network',
    'Redhat' => '/etc/sysconfig/network-scripts',
  }

  case $::osfamily {
    'Debian','RedHat','Amazon': { }
    default: {
      fail("${::operatingsystem} not supported. Review params.pp for extending support.")
    }
  }
}
