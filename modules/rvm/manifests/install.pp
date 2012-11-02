define rvm::install (
  $user, # the user to install for
  $ensure="stable"
) {
  include rvm::files

  exec {
    "get rvm for $user":
      require => [User[$user], Class["rvm::files"]],
      command => "/usr/bin/bootstrap-rvm.bash $branch",
      user => $user,
      path => [ "/bin", "/sbin", "/usr/bin", "/usr/sbin", "/usr/local/bin" ];
  }
}
