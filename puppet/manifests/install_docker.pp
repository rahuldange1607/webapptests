include 'docker'

class { 'docker':
	ensure => present,
	version => 'latest'
}