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
	class { '::rsyslog::client': }

	#Pam module configuration
	file_line { 'Replacing a line to /etc/pam.d/system-auth':
		path => '/etc/pam.d/system-auth',
	  line => 'password    requisite     pam_cracklib.so try_first_pass retry=3 minlen=8 ucredit=-1 ocredit=-1 dcredit=-1 lcredit=-1',
		match => "^password    requisite.*$",
	}

}
