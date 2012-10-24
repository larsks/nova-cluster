class salt::master {
  package { 'salt-master':
    ensure => installed,
  }

  file { '/etc/salt/master':
    content  => template('salt/master'),
    require => Package['salt-master'],
  }

  service { 'salt-master':
    ensure    => running,
    enable    => true,
    require   => Package['salt-master'],
    subscribe => File['/etc/salt/master'],
  }
}

