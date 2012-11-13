class truth::enforcer {
  Exec {
    path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin", "/usr/local/sbin" ]
  }

  include user::humans
  include virtualbox
  include statsd
  include demosite
  include demosite::logstash
  include logstashnet
  include jenkins
  include os
  include redis
  include shatty
}
