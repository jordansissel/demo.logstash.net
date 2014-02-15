class user::humans {
  user::managed {
    "jls": ensure => present, root => true, groups => [ "human", "docker" ];
    "nethier": ensure => present, root => false;
    "electrical": ensure => present, root => true;
    "drewr": ensure => present;
  }
}

