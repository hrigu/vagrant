class planik {
  file {
    ["/var/planik/",
     "/var/planik/shared/",
     "/var/planik/shared/config/"]:
      ensure => directory,
      owner  => vagrant,
      group  => vagrant,
      mode   => 775
  }
  file {
    "/var/planik/shared/config/database.yml":
      ensure  => present,
      owner   => vagrant,
      group   => vagrant,
      mode    => 600,
      source  => "puppet:///modules/planik/database.yml"
  }
  package {
    "bundler":
      provider => gem
  }
}