#!/bin/bash

cd puppet/install_docker_ce

echo "Building the puppet module to install docker"
rm -rf pkg
pdk build --force

echo "Uploading the puppet module to puppet forge"
pdk release --force --version 0.1.0

echo "Installing puppet module"
/opt/puppetlabs/bin/puppet module install install_docker_ce --version 0.1.0

echo "Adding puppet module to the default puppet manifest"
grep -qxF 'install_docker_ce' /etc/puppetlabs/code/environments/production/manifests/site.pp || echo 'class {''install_docker_ce'':}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
