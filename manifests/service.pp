# == Class postsrsd::service
#
# This class is meant to be called from postsrsd.
# It ensure the service is running.
#
class postsrsd::service {

  if $postsrsd::manage_service {
    service { $::postsrsd::service_name:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
