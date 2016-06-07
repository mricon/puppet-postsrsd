# Class: postsrsd
# ===========================
#
# Full description of class postsrsd here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class postsrsd (
  $package_name = $::postsrsd::params::package_name,
  $service_name = $::postsrsd::params::service_name,
  $srs_domain       = 'localdomain',
  $srs_forward_port = '10001',
  $srs_reverse_port = '10002',
) inherits ::postsrsd::params {

  # validate parameters here

  class { '::postsrsd::install': } ->
  class { '::postsrsd::config':
    srs_domain       => $srs_domain,
    srs_forward_port => $srs_forward_port,
    srs_reverse_port => $srs_reverse_port,
  } ~>
  class { '::postsrsd::service': } ->
  Class['::postsrsd']
}
