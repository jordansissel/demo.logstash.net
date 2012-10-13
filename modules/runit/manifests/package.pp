class runit::package {
  package {
    "runit": ensure => latest;
  }

  file {
    "/service":
      ensure => link,
      target => "/etc/service";
    "/var/log/service":
      ensure => directory,
      owner => root;
  }
}
