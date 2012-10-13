class statsd::package {
  user::app { "statsd": ; }

  package {
    "nodejs": ensure => latest;
  }

  vcsrepo {
    "/app/statsd/statsd":
      ensure => latest,
      require => User::App["statsd"],
      owner => "statsd",
      provider => "git",
      source => "https://github.com/etsy/statsd.git"
  }

  file {
    "/app/statsd/statsd/config.js":
      ensure => file,
      owner => "statsd",
      group => "statsd",
      source => "puppet:///modules/statsd/config.js";
  }
}
