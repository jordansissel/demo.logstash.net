class shatty::service {
  include ::shatty::package

  runit::process {
    "shatty":
      ensure => present,
      user => "shatty",
      require => Class["shatty::package"],
      command => "env PORT=8200 ruby web.rb",
      directory => "/app/shatty/shatty";
  }
}
