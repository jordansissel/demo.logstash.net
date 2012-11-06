define rvm::bundle_exec(
  $command,
  $user,
  $directory,
  $refreshonly = false,
  $path = [ "/bin", "/sbin", "/usr/sbin", "/usr/bin", "/usr/local/bin", "/usr/local/sbin" ]
) {

  exec {
    "bundle exec - $title":
      command => template("rvm/bundle_exec.sh.erb"),
      provider => shell,
      user => $user,
      refreshonly => $refreshonly,
      cwd => $directory;
  }
}
