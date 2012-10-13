class user {
  file {
    "/home": ensure => directory;
    "/app": ensure => directory;
}
