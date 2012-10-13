class virtualbox {

  apt::repo {
    "virtualbox":
      url => "http://download.virtualbox.org/virtualbox/debian",
      distribution => "precise",
      component => "contrib",
      key => "puppet:///modules/virtualbox/virtualbox.apt.key";
  }
}
