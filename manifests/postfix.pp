$templates = "${home}/bergerac/templates"

$sendgrid_auth = "static:${sendgrid_user}:${sendgrid_pass}"

file { '/etc/postfix/main.cf':
  content => template("${templates}/postfix/main.cf.erb"),
  group   => 'wheel',
  owner   => 'root'
}
