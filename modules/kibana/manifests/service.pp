class kibana::service {
  include ::kibana::package

  runit::process {
    "kibana":
      ensure => present,
      user => "kibana",
      require => Class["kibana::package"],
      command => "env KIBANA_CONFIG=/app/kibana/kibana.conf ruby kibana.rb",
      directory => "/app/kibana/kibana";
  }

  file {
    "/app/kibana/kibana/KibanaConfig.rb":
      ensure => file,
      require => Class["kibana::package"],
      notify => Runit::Process["kibana"],
      owner => "kibana",
      group => "kibana",
      source => "puppet:///modules/kibana/KibanaConfig.rb";
  }
}
