class logstashnet::cookbook {
  user::app { "cookbook.logstash.net": ; }

  vcsrepo {
    "/app/cookbook.logstash.net/cookbook.logstash.net":
      ensure => latest,
      require => User::App["cookbook.logstash.net"],
      owner => "cookbook.logstash.net",
      provider => "git",
      revision => "gh-pages",
      notify => Rvm::Bundle_Exec["regen cookbook.logstash.net"],
      source => "https://github.com/logstash/cookbook";
  }

  rvm::install {
    "for cookbook.logstash.net":
      user => "cookbook.logstash.net",
      require => User::App["cookbook.logstash.net"];
  }

  rvm::bundle_exec {
    "regen cookbook.logstash.net":
      require => Rvm::Install["for cookbook.logstash.net"],
      command => "bash regen.sh",
      user => "cookbook.logstash.net",
      #refreshonly => true,
      directory => "/app/cookbook.logstash.net/cookbook.logstash.net";
  }

  file {
    "$apache::params::vdir/cookbook.logstash.net.conf":
      ensure => file,
      source => "puppet:///modules/logstashnet/cookbook.logstash.net.conf",
      # I don't like notifying an external service (defined by the 'apache' class)
      # but the puppetlabs/apache module defines it there and until I patch it
      # this is what is required. After fixing the apache module, I'll be
      # able to do: notify => Class["apache::service"]
      notify => Service["httpd"];
  }
}
