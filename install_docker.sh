#!/bin/bash

cd puppet/install_docker_ce

echo "Building the puppet module install_docker_ce"
rm -rf pkg
pdk build --force

echo "Installing puppet module install_docker_ce"
/opt/puppetlabs/bin/puppet module install puppetlabs-pwshlib --version 0.5.0
/opt/puppetlabs/bin/puppet module install pkg/edureka-install_docker_ce-0.1.0.tar.gz --force --ignore-dependencies

echo "Adding puppet module install_docker_ce to the default puppet manifest"
grep -qxF 'install_docker_ce' /etc/puppetlabs/code/environments/production/manifests/site.pp || echo 'class {''install_docker_ce'':}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp

echo "Installing puppet module maven"
/opt/puppetlabs/bin/puppet module install maestrodev-maven --version 1.4.0

echo "Adding puppet module maven to the default puppet manifest"
grep -qxF 'maven::maven' /etc/puppetlabs/code/environments/production/manifests/site.pp || echo 'class { ''maven::maven'':version => ''3.6.3'',}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
