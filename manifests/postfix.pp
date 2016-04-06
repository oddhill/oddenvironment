$templates = "${home}/bergerac/templates"

$sendgrid_auth = "static:${sendgrid_user}:${sendgrid_pass}"

file { '/etc/postfix/main.cf':
  content => template("${templates}/postfix/main.cf.erb"),
  group   => 'wheel',
  owner   => 'root',
  notify  => Exec['restart postfix']
}

exec { 'restart postfix' :
  command => 'postfix stop && postfix start || postfix start',
  cwd => '/usr/sbin',
  user => 'root',
  refreshonly => true
}
