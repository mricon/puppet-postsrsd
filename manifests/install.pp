# == Class postsrsd::install
#
# This class is called from postsrsd for install.
#
class postsrsd::install {

  if $postsrsd::manage_package {
    package { $postsrsd::package_name:
      ensure => present,
    }
  }
}
