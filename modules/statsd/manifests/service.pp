class statsd::service {
  include ::statsd::package

  runit::process {
    "statsd":
      ensure => present,
      require => Class["statsd::package"],
      command => "node stats.js config.js",
      directory => "/apps/statsd/statsd";
  }
}
