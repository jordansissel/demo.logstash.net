class user::humans {
  user::managed {
    "jls": ensure => present, root => true;
    "nethier": ensure => present, root => true;
    "electrical": ensure => present, root => true;
    "drewr": ensure => present;
  }
}

