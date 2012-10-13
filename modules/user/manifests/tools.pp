class user::tools {
  package {
    "build-essential": ensure => latest;
    "clang": ensure => latest;
    "cscope": ensure => latest;
    "exuberant-ctags": ensure => latest;
    "vim": ensure => latest;
    "gcc": ensure => latest;
    "g++": ensure => latest;
    "gdb": ensure => latest;
    "git": ensure => latest;
    "libtool": ensure => latest;
    "libltdl7": ensure => latest;
    "libltdl-dev": ensure => latest;
    "lsof": ensure => latest;
    "nmap": ensure => latest;
    "libssl-dev": ensure => latest;
    "libreadline6": ensure => latest;
    "readline-common": ensure => latest;
    "strace": ensure => latest;
    "valgrind": ensure => latest;
    "zsh": ensure => latest;
  }
}
