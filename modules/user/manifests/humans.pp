class user::humans {
  user::managed {
    "jls": ensure => present, root => true, groups => [ "human", "docker" ];
    "untergeek": ensure => present, root => true;
    "nethier": ensure => present, root => false;
    "electrical": ensure => present, root => true;
    "colin": ensure => present, root => true;
    "drewr": ensure => present;
  }
}

