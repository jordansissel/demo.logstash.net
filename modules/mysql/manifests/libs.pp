class mysql::libs {
  package {
    "libmysqlclient-dev": ensure => latest;
  }
}
