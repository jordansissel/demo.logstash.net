class logstashnet {
  include apache
  include apache::params
  include apache::mod::default
  include logstashnet::cookbook

  user::app { "logstash.net": ; }

  vcsrepo {
    "/app/logstash.net/logstash.net":
      ensure => latest,
      require => User::App["logstash.net"],
      owner => "logstash.net",
      provider => "git",
      revision => "master",
      notify => Rvm::Bundle_Exec["regen logstash.net"],
      source => "https://github.com/logstash/logstash.net";
  }

  rvm::install {
    "for logstash.net":
      user => "logstash.net",
      require => User::App["logstash.net"];
  }

  rvm::bundle_exec {
    "regen logstash.net":
      require => Rvm::Install["for logstash.net"],
      command => "bash regen.sh",
      user => "logstash.net",
      #refreshonly => true,
      directory => "/app/logstash.net/logstash.net";
  }

  file {
    "$apache::params::vdir/logstash.net.conf":
      ensure => file,
      source => "puppet:///modules/logstashnet/logstash.net.conf",
      # I don't like notifying an external service (defined by the 'apache' class)
      # but the puppetlabs/apache module defines it there and until I patch it
      # this is what is required. After fixing the apache module, I'll be
      # able to do: notify => Class["apache::service"]
      notify => Service["httpd"];
  }
}
