# == Class statsd::config
#
# This class is called from statsd for service config.
#
class statsd::config {
  file { '/etc/statsd/config.js':
    ensure  => present,
    content => template('statsd/config.js.erb'),
  }
}
