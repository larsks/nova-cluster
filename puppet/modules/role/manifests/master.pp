class role::master {
  notify { 'This is a cluster master.': }

  include role::node
  include salt::master

  file { '/etc/sysconfig/iptables':
    source => 'puppet:///modules/role/master/iptables',
    notify => Service['iptables'],
  }

  service { 'iptables': }
}

