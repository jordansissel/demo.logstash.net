class virtualbox {

  apt::repo {
    "virtualbox":
      url => "http://download.virtualbox.org/virtualbox/debian"
      distribution => "precise",
      components => "contrib",
      key => "puppet:///modules/virtualbox/virtualbox.apt.key";
  }
}
