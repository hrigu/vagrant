class mysql {

  package {
    "mysql-server":
      ensure => installed,
      before => File["/etc/mysql/my.cnf"]
  }

  file {
    "/etc/mysql/my.cnf":
      owner  => root,
      group  => root,
      mode   => 644,
      source => "puppet:///modules/mysql/my.cnf"
  }

  service {
    "mysql":
      ensure    => running,
      subscribe => File["/etc/mysql/my.cnf"]
  }

  exec {
    "mysql_password":
      unless  => "mysqladmin -uroot -pnath status",
      command => "mysqladmin -uroot password nath",
      require => Service[mysql];
    "planik_db":
      unless  => "mysql -uroot -pnath peopleplanning",
      command => "mysql -uroot -pnath -e 'create database peopleplanning'",
      require => Exec["mysql_password"]
  }

}