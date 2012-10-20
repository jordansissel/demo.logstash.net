class redis::service {
  include ::kibana::package

  runit::process {
    "redis":
      ensure => present,
      user => "redis",
      require => Class["redis::package"],
      command => "/app/redis/run.sh",
      directory => "/app/redis/redis";
  }

  file {
    "/app/redis/redis.conf":
      ensure => file,
      require => Class["kibana::package"],
      notify => Runit::Process["redis"],
      owner => "redis",
      group => "redis",
      source => "puppet:///modules/redis/redis.conf";
  }
}
