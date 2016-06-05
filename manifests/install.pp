# == Class postsrsd::install
#
# This class is called from postsrsd for install.
#
class postsrsd::install {

  package { $::postsrsd::package_name:
    ensure => present,
  }
}
