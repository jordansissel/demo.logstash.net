class statsd::package {
  user::app { "statsd": ; }

  vcsrepo {
    "/app/statsd/statsd":
      ensure => latest,
      require => User::App["statsd"],
      owner => "statsd",
      provider => "git",
      source => "https://github.com/etsy/statsd.git"
  }
}
