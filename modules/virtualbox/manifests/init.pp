class virtualbox {
  apt::source {
    "virtualbox":
      require => Apt::Key["oracle-virtualbox"],
      location => "http://download.virtualbox.org/virtualbox/debian",
      release => "precise",
      include_src  => false,
      repos => "contrib";
  }

  apt::key {
    "oracle-virtualbox":
      key => "98AB5139",
      key_source => "http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc";
  }

  package {
    "virtualbox-4.2":
      require => [Apt::Source["virtualbox"], Apt::Key["oracle-virtualbox"]],
      ensure => latest;
  }
}
