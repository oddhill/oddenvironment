file { '/usr/local/etc/my.cnf':
  content => template("${templates}/mysql/my.cnf.erb"),
  owner   => $user
}
