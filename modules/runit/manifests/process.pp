define runit::process(
  $command, # the command to run
  $user, # the user to run as
  $groups = undef
  $ensure="present",
  $directory="/",
  $serviceroot="/etc/service",
  $logroot="/var/log/service"
) {
  include ::runit::package
  include ::runit::service

  $servicedir = "$serviceroot/$name"
  $logdir = "$logroot/$name"

  $ensure_file = $ensure
  $ensure_directory = $ensure ? { "absent" => "absent", default => "directory" }

  if $groups == undef {
    $_groups = ["$user"]
  } else
    $_groups = $groups
  }

  if $ensure == "absent" {
    exec {
      "stop runit::process $name":
        command => "/usr/bin/sv force-stop $servicedir",
        before => File["$servicedir"];
    }
  }

  file {
    "$servicedir": 
      ensure => $ensure_directory;
    "$servicedir/run":
      ensure => $ensure_file,
      require => [ File["$servicedir/log/run"], File["$logdir"] ],
      mode => 0755,
      content => template("runit/run.sh.erb");
    "$servicedir/log":
      ensure => $ensure_directory;
    "$servicedir/log/run":
      ensure => file,
      notify => Exec["restart $servicedir/log"],
      require => File["$logdir"],
      mode => 0755,
      content => template("runit/log.sh.erb");
    "$logdir":
      ensure => $ensure_directory,
      require => User["runitlog"],
      owner => "runitlog";
    "$logdir/config":
      ensure => $ensure,
      notify => Exec["restart $servicedir/log"],
      require => User["runitlog"],
      owner => "runitlog",
      content => "s52428800\n";
    "/var/log/${name}":
      ensure => link,
      target => "$logdir/current";
  }

  exec {
    "restart $servicedir/log":
      command => "/usr/bin/sv restart $servicedir/log",
      refreshonly => true;
  }
}
