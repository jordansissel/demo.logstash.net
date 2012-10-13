class demosite {
  include apache
  include apache::params

  file {
    "$apache::params::vdir/demo.conf":
      ensure => file,
      source => "puppet:///modules/demosite/demo.conf",
      # I don't like notifying an external service (defined by the 'apache' class)
      # but the puppetlabs/apache module defines it there and until I patch it
      # this is what is required. After fixing the apache module, I'll be
      # able to do: notify => Class["apache::service"]
      notify => Service["httpd"];
  }
    
}
