node default {
  group { 'puppet' : ensure => present; }
    include jenkins
  jenkins::plugin {
    'git' :
      ensure  => present,
      require => Class['jenkins'];
  }
}
