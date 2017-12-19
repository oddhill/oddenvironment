# Dnsmasq configs
$dnsmasq_host = '127.0.0.1'
$dnsmasq_tld = 'localhost'

file { '/usr/local/etc/dnsmasq.conf':
  content => template("${templates}/dnsmasq/dnsmasq.conf.erb"),
  owner   => $user,
  group   => wheel
}
file { '/etc/resolver':
  ensure => 'directory',
  owner   => root,
  group   => wheel
}
file { '/etc/resolver/localhost':
  content => 'nameserver 127.0.0.1',
  owner   => root,
  group   => wheel,
  require => File['/etc/resolver']
}
