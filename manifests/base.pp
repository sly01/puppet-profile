class profile::base(
	$ntp_servers = [
		'0.ubuntu.pool.ntp.org',
		'1.ubuntu.pool.ntp.org',
	],
) {
	include ::ssh
	class { '::ntp': 
		servers => $ntp_servers,
	}

	if $facts['os']['family'] == 'RedHat' {
		include ::profile::selinux
	}
	notify { 'Production enviroment !!': }

	class { '::rsyslog::client':
    log_local  => true,
		log_remote => false,
  }

}
