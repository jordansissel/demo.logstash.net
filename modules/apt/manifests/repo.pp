define apt::repo(
  $url, # The url to the repo
  $distribution, # the distribution name, like 'precise' or 'lucid'
  $component, # the component name, like 'main' or 'contrib'
  $key=false # the path to any gpg key to add for this repo.
) {

  include apt::update

  if ($key) {
    file {
      "/etc/apt/$name.key":
        ensure => file,
        notify => Exec["add $name apt key"]:
        source => $key;
    }

    exec {
      "add $name apt key":
        command => "apt-key add /etc/apt/virtualbox.key",
        refreshonly => true;
    }
  }

  file {
    "/etc/apt/source.list.d/$name.list":
      ensure => file,
      notify => Class["apt::update"],
      content => "deb $url $distribution $component\n";
  }
}
