# == Class statsd::service
#
# This class is meant to be called from statsd.
# It ensure the service is running.
#
class statsd::service {

  service { $::statsd::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
