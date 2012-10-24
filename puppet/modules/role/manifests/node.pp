class role::node {
  notify { 'This is a cluster node.': }

  include salt::minion

  if ! $salt_master_ip {
    $salt_master_ip = '127.0.0.1'
  }

  host { 'salt':
    ip => $salt_master_ip,
  }
}

