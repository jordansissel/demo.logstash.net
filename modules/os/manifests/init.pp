class os {
  file {
    "/etc/security/limits.conf":
      ensure => file,
      owner => root,
      group => root,
      source => "puppet:///modules/os/limits.conf";
  }
}
