class profile::apache(
	Hash $apache_vhost_servers,
	Boolean $default_vhost = false,

) {
	class { '::apache':
		default_vhost => $default_vhost,
	}
	
	#$docroot = "/var/www/${facts['fqdn']}"

	#::apache::vhost { $facts['fqdn']:
	#	port 		=> 80,
	#	docroot => $docroot,
	#	before  => File["${docroot}/index.html"],
	#}

	#file { "${docroot}/index.html":
	#	ensure => file,
	#	content => "This is ${facts['fqdn']} web page\n",
	#}

	create_resources(::apache::vhost, $apache_vhost_servers)
}
