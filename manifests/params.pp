# == Class postsrsd::params
#
# This class is meant to be called from postsrsd.
# It sets variables according to platform.
#
class postsrsd::params {
  $manage_package = true
  $manage_service = true

  case $::osfamily {
    'Debian': {
      $package_name   = 'postsrsd'
      $service_name   = 'postsrsd'
      $sysconfig_file = '/etc/default/postsrsd'
    }
    'RedHat', 'Amazon': {
      $package_name   = 'postsrsd'
      $service_name   = 'postsrsd'
      $sysconfig_file = '/etc/sysconfig/postsrsd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
