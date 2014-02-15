class user::groups {
  group {
    "sudo": ensure => present;
    "docker": ensure => present;
    "human": ensure => present;
    "apps": ensure => present;
  }
}
