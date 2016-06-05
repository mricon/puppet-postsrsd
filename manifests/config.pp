# == Class postsrsd::config
#
# This class is called from postsrsd for service config.
#
class postsrsd::config {
  file { '/etc/sysconfig/postsrsd':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('postsrsd/postsrsd.sysconfig.erb'),
    notify  => Service[$::postsrsd::service_name],
  }
}
