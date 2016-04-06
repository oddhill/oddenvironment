$sendgrid_auth = "static:${sendgrid_user}:${sendgrid_pass}"

file { '/etc/postfix/main.cf':
  content => template("${templates}/postfix/main.cf.erb"),
  group   => 'wheel',
  owner   => 'root',
  notify  => Exec['restart postfix']
}

exec { 'restart postfix' :
  command => '/usr/sbin/postfix stop && /usr/sbin/postfix start || /usr/sbin/postfix start',
  user => 'root',
  refreshonly => true
}
