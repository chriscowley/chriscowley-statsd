# == Class statsd::install
#
# This class is called from statsd for install.
#
class statsd::install {

  package { $::statsd::package_name:
    ensure => present,
  }
}
