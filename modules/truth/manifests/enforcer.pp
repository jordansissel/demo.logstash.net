class truth::enforcer {
  Exec {
    path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin", "/usr/local/sbin" ]
  }

  include user::humans
  include virtualbox
  include statsd
  include demosite
  include logstashnet
  include jenkins
  include os
  include redis
}
