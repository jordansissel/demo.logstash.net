define user::app($ensure="present", $groups=["apps"], $shell="/bin/false") {
  include ::user::groups
  include ::user

  user {
    "$name":
      ensure => $ensure,
      shell => $shell,
      groups => $groups;
  }

  if ($ensure == "present") {
    file {
      "/app/$name":
        ensure => directory,
        require => User[$name],
        owner => $name,
        group => "apps",
        mode => 755;
    }
  }
}
