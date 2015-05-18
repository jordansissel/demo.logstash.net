class truth::enforcer {
  Exec {
    path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin", "/usr/local/sbin" ]
  }

  #include user::humans
  #include os

  if ($demo) {
    #include virtualbox
    #include statsd
    #include demosite
    #include demosite::logstash
    #include jenkins
    #include redis
    #include shatty
  }
  include logstashnet
}
