class shatty::package {
  user::app { "shatty": ; }

  package {
    "ruby1.9.3": ensure => latest;
    "libcurl4-openssl-dev": ensure => latest;
  }

  vcsrepo {
    "/app/shatty/shatty":
      ensure => latest,
      require => User::App["shatty"],
      owner => "shatty",
      provider => "git",
      revision => "shatty-ruby",
      source => "https://github.com/jordansissel/shatty"
  }
}
