class user::tools {
  package {
    "build-essential": ensure => latest;
    "clang": ensure => latest;
    "cscope": ensure => latest;
    "ctags": ensure => latest;
    "gcc": ensure => latest;
    "gdb": ensure => latest;
    "git": ensure => latest;
    "libtool": ensure => latest;
    "libtool-ltdl-devel": ensure => latest;
    "libtool-ltdl": ensure => latest;
    "lsof": ensure => latest;
    "nmap": ensure => latest;
    "openssl-devel": ensure => latest;
    "readline-devel": ensure => latest;
    "readline": ensure => latest;
    "strace": ensure => latest;
    "valgrind": ensure => latest;
    "zsh": ensure => latest;
  }
}
