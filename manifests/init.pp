# Class: statsd
# ===========================
#
# Full description of class statsd here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class statsd (
  $package_name = $::statsd::params::package_name,
  $service_name = $::statsd::params::service_name,
) inherits ::statsd::params {

  # validate parameters here

  class { '::statsd::install': } ->
  class { '::statsd::config': } ~>
  class { '::statsd::service': } ->
  Class['::statsd']
}
