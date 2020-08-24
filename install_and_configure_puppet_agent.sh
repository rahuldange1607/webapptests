#!/bin/bash:wq

echo "Adding Puppet Repo"
ufw enable
ufw allow 8140
apt update 
wget https://apt.puppetlabs.com/puppet6-release-bionic.deb 
dpkg -i puppet6-release-bionic.deb 
apt update


echo "Installing puppet agent"
apt install -y puppet-agent


echo "Updating puppent agent config"
grep -qxF '[main]' /etc/puppetlabs/puppet/puppet.conf || echo '[main]' >> /etc/puppetlabs/puppet/puppet.conf
grep -qxF 'certname = puppetagent' /etc/puppetlabs/puppet/puppet.conf || echo 'certname = puppetagent' >> /etc/puppetlabs/puppet/puppet.conf
grep -qxF 'server = puppet' /etc/puppetlabs/puppet/puppet.conf || echo 'server = puppet' >> /etc/puppetlabs/puppet/puppet.conf
grep -qxF 'environment = production' /etc/puppetlabs/puppet/puppet.conf || echo 'environment = production' >> /etc/puppetlabs/puppet/puppet.conf
grep -qxF 'runinterval = 15m' /etc/puppetlabs/puppet/puppet.conf || echo 'runinterval = 15m' >> /etc/puppetlabs/puppet/puppet.conf


echo "Starting and enabling the puppet server"
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

