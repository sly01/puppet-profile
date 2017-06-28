class profile::nginx {
	include ::nginx

	::nginx::vhost { $::fqdn: }

}
