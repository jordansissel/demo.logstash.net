class virtualbox {

  apt::repo {
    "virtualbox":
      url => "http://download.virtualbox.org/virtualbox/debian",
      distribution => "precise",
      component => "contrib",
      key => "puppet:///modules/virtualbox/virtualbox.apt.key";
  }

  package {
    "virtualbox-4.2":
      require => Apt::Repo["virtualbox"],
      ensure => latest;
  }
}
