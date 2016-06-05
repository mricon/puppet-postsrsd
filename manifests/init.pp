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
) inherits ::postsrsd::params {

  # validate parameters here

  class { '::postsrsd::install': } ->
  class { '::postsrsd::config': } ~>
  class { '::postsrsd::service': } ->
  Class['::postsrsd']
}
