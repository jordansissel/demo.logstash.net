class statsd::service {
  include ::statsd::package

  runit::process {
    "statsd":
      ensure => present,
      user => "statsd",
      require => Class["statsd::package"],
      command => "node stats.js config.js",
      directory => "/app/statsd/statsd";
  }
}
