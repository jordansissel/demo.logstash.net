class virtualbox {

  apt::source {
    "virtualbox":
      require => Apt::Key["oracle-virtualbox"],
      location => "http://download.virtualbox.org/virtualbox/debian",
      release => "precise",
      repos => "contrib";
  }

  apt::key {
    "oracle-virtualbox":
      key => "98AB5139",
      key_source => "http://public-yum.oracle.com/";
  }

  package {
    "virtualbox-4.2":
      require => Apt::Source["virtualbox"],
      ensure => latest;
  }
}
