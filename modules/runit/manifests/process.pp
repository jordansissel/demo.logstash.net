define runit::process(
  $command, # the command to run
  $user, # the user to run as
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
  $ensure_directory = $ensure ? { "absent" => "absent", default => "present" }

  if $ensure == "absent" {
    exec {
      "stop runit::process[$name]":
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
      ensure => $ensure_file;
    "$servicedir/log/run":
      ensure => file,
      require => File["$logdir"],
      mode => 0755,
      content => template("runit/log.sh.erb");
    "$logdir":
      ensure => $ensure_directory,
      require => User["runitlog"],
      owner => "runitlog";
  }
}
