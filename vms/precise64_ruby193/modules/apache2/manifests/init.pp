class apache2 {
  exec { 'apt-get update':
      command => '/usr/bin/apt-get update'
  }

  package { "apache2":
      ensure => present,
  }

  service { "apache2":
      ensure    => running,
      require   => Package["apache2"],
  }

    file { "/etc/apache2/conf":
      source  => "puppet:///modules/apache2/apache2.conf",      #interessanterweise nicht ../apaches2/files/apache2.conf
      mode    => 644,
      owner   => root,
      group   => root
    }
}
