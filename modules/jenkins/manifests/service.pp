class jenkins::service {
  include ::jenkins::package

  runit::process {
    "jenkins":
      ensure => present,
      user => "jenkins",
      require => Class["jenkins::package"],
      command => "sh run.sh",
      directory => "/app/jenkins";
  }
}
