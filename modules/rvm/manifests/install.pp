define rvm::install(
  $user, # the user to install for
  $ensure="stable"
) {

  $install_exec = "install rvm for $user"
  $version_exec = "ensure rvm version for $user"

  file {
    "/usr/bin/bootstrap-rvm.bash":
      ensure => file,
      mode => 755,
      owner => root,
      group => root,
      source => "puppet:///modules/rvm/bootstrap-rvm.bash";
  }

  exec {
    "get rvm for $user":
      require => [User[$user], File["/usr/bin/bootstrap-rvm.bash"]],
      command => "/usr/bin/bootstrap-rvm.bash $branch",
      user => $user,
      path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin" ];
  }
}
