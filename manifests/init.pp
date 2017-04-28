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
  Boolean        $manage_package = $postsrsd::params::manage_package,
  String         $package_name   = $postsrsd::params::package_name,
  Boolean        $manage_service = $postsrsd::params::manage_service,
  String         $service_name   = $postsrsd::params::service_name,
  Pattern['^\/'] $sysconfig_file = $postsrsd::params::sysconfig_file,
) inherits postsrsd::params {

  anchor { 'postsrsd::begin': }
  ->class { '::postsrsd::install': }
  ->class { '::postsrsd::config': }
  ->class { '::postsrsd::service': }
  ->anchor { 'postsrsd::end': }
}
