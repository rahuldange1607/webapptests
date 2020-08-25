#!/bin/bash

cd puppet/install_docker_ce

echo "Building the puppet module to install docker"
pdk build

echo "Installing puppet module"
/opt/puppetlabs/bin/puppet module install pkg/install_docker_ce-0.1.0.tar.gz

echo "Adding puppet module to the default puppet manifest"
grep -qxF 'class {''docker'':}' /etc/puppetlabs/code/environments/production/manifests/site.pp || echo 'class {''docker'':}' >> /etc/puppetlabs/code/environments/production/manifests/site.pp
