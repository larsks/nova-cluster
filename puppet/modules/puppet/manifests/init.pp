class puppet {
  package { 'puppet':
    ensure => installed,
  }

  file { '/etc/puppet/puppet.conf':
    source => 'puppet:///modules/puppet/puppet.conf',
  }

  file { '/bin/user-data-enc':
    source => 'puppet:///modules/puppet/user-data-enc',
    mode   => 0755,
  }
}

