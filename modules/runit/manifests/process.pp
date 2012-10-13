define runit::process(
  $command, # the command to run
  $user, # the user to run as
  $directory="/",
  $serviceroot="/etc/service",
  $logroot="/var/log/service"
) {
  include ::runit::package
  include ::runit::service

  $servicedir = "$serviceroot/$name"

  file {
    "$servicedir": 
      ensure => directory;
    "$servicedir/run":
      ensure => file,
      require => [ File["$servicedir/log/run"], File["$logroot/$name"] ],
      mode => 0755,
      content => template("runit/run.sh.erb");
    "$servicedir/log":
      ensure => directory;
    "$servicedir/log/run":
      ensure => file,
      mode => 0755,
      content => template("runit/log.sh.erb");
    "$logroot/$name":
      ensure => directory;
  }
}
