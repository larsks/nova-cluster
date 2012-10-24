class salt::minion {
  package { 'salt-minion':
    ensure => installed,
  }

  file { '/etc/salt/minion':
    content => template('salt/minion'),
    require => Package['salt-minion'],
  }

  service { 'salt-minion':
    ensure    => running,
    enable    => true,
    require   => Package['salt-minion'],
    subscribe => File['/etc/salt/minion'],
  }
}

