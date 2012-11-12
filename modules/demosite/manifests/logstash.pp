class demosite::logstash {
  user::app { "logstash-demo": ; }

  runit::process {
    "logstash-demo":
      ensure => present,
      user => "logstash",
      require => User::App["logstash-demo"],
      command => "sh logstash.sh",
      directory => "/app/logstash-demo";
  }

  file {
    "/app/logstash/demo.conf":
      ensure => file,
      notify => Runit::Process["logstash-demo"],
      owner => "logstash-demo",
      group => "logstash-demo",
      content => template("demosite/demo.conf.erb");
  }
}
