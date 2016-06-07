# == Class postsrsd::config
#
# This class is called from postsrsd for service config.
#
class postsrsd::config (
  $srs_domain       = 'localdomain',
  $srs_forward_port = '10001',
  $srs_reverse_port = '10002',
) {

  # the sysconfig file *needs* these defaults to function;
  # otherwise empty values get passed to command line flags,
  # confusing postsrsd
  file { '/etc/sysconfig/postsrsd':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('postsrsd/postsrsd.sysconfig.erb'),
    notify  => Service[$::postsrsd::service_name],
  }
}
