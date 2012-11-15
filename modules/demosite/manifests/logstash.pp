class demosite::logstash {
  user::app { "logstash-demo": ; }

  runit::process {
    "logstash-demo":
      ensure => present,
      user => "logstash-demo",
      require => User::App["logstash-demo"],
      command => "sh logstash.sh agent -v -f demo.conf",
      directory => "/app/logstash-demo";
  }

  file {
    "/app/logstash-demo/logstash.sh":
      ensure => file,
      notify => Runit::Process["logstash-demo"],
      mode => 0755,
      owner => "logstash-demo",
      group => "logstash-demo",
      source => "puppet:///modules/demosite/logstash.sh";
    "/app/logstash-demo/demo.conf":
      ensure => file,
      notify => Runit::Process["logstash-demo"],
      owner => "logstash-demo",
      group => "logstash-demo",
      content => template("demosite/demo.conf.erb");
  }
}
