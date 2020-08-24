#!/bin/bash

echo "Installing puppet module for docker"
/opt/puppetlabs/bin/puppet module install puppetlabs-docker --version 3.11.0

echo "Installing docker using puppet module"
/opt/puppetlabs/bin/puppet apply ./puppet/manifests/include_docker.pp
