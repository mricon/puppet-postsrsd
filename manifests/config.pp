# == Class postsrsd::config
#
# This class is called from postsrsd for service config.
#
class postsrsd::config (
  String             $srs_domain          = undef,
  Optional[Array]    $srs_exclude_domains = undef,
  String             $srs_separator       = '=',
  Pattern['^\/']     $srs_secret_file     = '/etc/postsrsd.secret',
  String[24]         $srs_secret_content  = undef,
  Integer            $srs_hashlength      = 4,
  Integer            $srs_hashmin         = 4,
  Integer[0, 65535]  $srs_forward_port    = 10001,
  Integer[0, 65535]  $srs_reverse_port    = 10002,
  String             $srs_listen_addr     = '127.0.0.1',
  String             $run_as              = 'nobody',
  Optional[String]   $chroot              = undef,
) {

  # the sysconfig file *needs* these defaults to function;
  # otherwise empty values get passed to command line flags,
  # confusing postsrsd
  file { $::postsrsd::sysconfig_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('postsrsd/postsrsd.sysconfig.erb'),
    notify  => Service[$::postsrsd::service_name],
  }

  file { $srs_secret_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => $srs_secret_content,
    notify  => Service[$::postsrsd::service_name],
  }
}
