$templates = "${home}/bergerac/templates"

$bergerac_user = $user

# Apache configs
$apache_port = 80
$apache_port_ssl = 443
$apache_sites_dir = "${home}/Sites"
$apache_config_dir = '/etc/apache2'
$apache_log_dir = '/private/var/log/apache2'
$apache_cert = "${home}/bergerac/data/ssl/apache.crt"
$apache_cert_key = "${home}/bergerac/data/ssl/apache.key"

file { '/etc/apache2/extra/httpd-vhosts.conf':
  content => template("${templates}/apache/httpd-vhosts.conf.erb"),
  owner   => root,
  group   => wheel
}
file { '/etc/apache2/extra/httpd-ssl.conf':
  content => template("${templates}/apache/httpd-ssl.conf.erb"),
  owner   => root,
  group   => wheel
}
file { '/etc/apache2/httpd.conf':
  content => template("${templates}/apache/httpd.conf.erb"),
  owner   => root,
  group   => wheel
}
