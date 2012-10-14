class jenkins::package {
  user::app { "jenkins": ; }

  file {
    "/app/jenkins/run.sh": 
      require => User::App["jenkins"],
      owner => jenkins,
      group => jenkins,
      mode => 0755,
      source => "puppet:///modules/jenkins/run.sh";

  }
}
