class statsd::package {
  user::app { "statsd": ; }

  ::vcsrepo {
    "/app/statsd/statsd":
      ensure => latest,
      provider => "git",
      source => "https://github.com/etsy/statsd.git"
  }
}
