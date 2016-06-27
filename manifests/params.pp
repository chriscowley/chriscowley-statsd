# == Class statsd::params
#
# This class is meant to be called from statsd.
# It sets variables according to platform.
#
class statsd::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'statsd'
      $service_name = 'statsd'
    }
    'RedHat', 'Amazon': {
      $package_name = 'statsd'
      $service_name = 'statsd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
