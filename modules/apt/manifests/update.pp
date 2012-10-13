class apt::update {
  exec {
    "apt-get update": ;
  }

  Package <| |> {
    require => Exec["apt-get update"]
  }
}
