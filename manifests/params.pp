# == Class postsrsd::params
#
# This class is meant to be called from postsrsd.
# It sets variables according to platform.
#
class postsrsd::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'postsrsd'
      $service_name = 'postsrsd'
    }
    'RedHat', 'Amazon': {
      $package_name = 'postsrsd'
      $service_name = 'postsrsd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
