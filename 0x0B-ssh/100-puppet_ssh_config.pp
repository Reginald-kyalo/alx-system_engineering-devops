#configues ssh client to use private key in school file
#and to refuse to authenticate using a password
file { '/etc/ssh/ssh_config':
  ensure => present,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => '/etc/ssh/ssh_config',
}

augeas { 'ssh_config':
  context => '/etc/ssh/ssh_config',
  changes => [
    'set PasswordAuthentication no',
    'set IdentityFile ~/.ssh/school',
  ],
}
