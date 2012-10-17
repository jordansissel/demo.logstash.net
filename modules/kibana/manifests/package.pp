class kibana::package {
  user::app { "kibana": ; }

  package {
    "ruby1.9.3": ensure => latest;
    "libcurl4-openssl-dev": ensure => latest;
  }

  vcsrepo {
    "/app/kibana/kibana":
      ensure => latest,
      require => User::App["statsd"],
      owner => "kibana",
      provider => "git",
      revision => "master",
      source => "https://github.com/rashidkpc/Kibana"
  }
}
