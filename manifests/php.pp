$php_mysql_socket = '/private/tmp/mysql.sock'

file { '/usr/local/etc/php/5.6/php.ini':
  content => template("${templates}/php/php.ini.erb")
}

file { '/usr/local/etc/php/5.6/php-cli.ini':
  content => template("${templates}/php/php-cli.ini.erb")
}

file { '/usr/local/etc/php/5.6/conf.d/ext-xdebug.ini':
  ensure => absent
}
