$templates = "${home}/bergerac/templates"

$php_mysql_socket = '/private/tmp/mysql.sock'

file { '/usr/local/etc/php/5.5/php.ini':
  content => template("${templates}/php/php.ini.erb")
}
