class os {
  file {
    "/etc/security/limits.conf":
      ensure => file,
      owner => root,
      group => root,
      content => "puppet:///modules/os/limits.conf";
  }
}
