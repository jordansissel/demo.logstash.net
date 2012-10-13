class demosite {
  include apache
  include apache::params

  file {
    "$apache::params::vdir/demo.conf":
      ensure => file,
      source => "puppet:///modules/demosite/demo.conf",
      notify => Class["apache"];
  }
    
}
