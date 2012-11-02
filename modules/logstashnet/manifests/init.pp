class demosite {
  include apache
  include apache::params
  include apache::mod::default

  user::app { "logstash.net": ; }

  #vcsrepo {
    #"/app/logstash.net/logstash.net":
      #ensure => latest,
      #require => User::App["logstash.net"],
      #owner => "logstash.net",
      #provider => "git",
      #revision => "master",
      #notify => Exec["regen logstash.net"],
      #source => "https://github.com/logstash/logstash.github.com"
  #}

  #file {
    #"$apache::params::vdir/logstash.net.conf":
      #ensure => file,
      #source => "puppet:///modules/demosite/logstash.net.conf",
      ## I don't like notifying an external service (defined by the 'apache' class)
      ## but the puppetlabs/apache module defines it there and until I patch it
      ## this is what is required. After fixing the apache module, I'll be
      ## able to do: notify => Class["apache::service"]
      #notify => Service["httpd"];
  #}
}
