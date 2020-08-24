#!/bin/bash

echo "Installing docker module"
/opt/puppetlabs/bin/puppet module install puppetlabs-docker --version 3.11.0

echo "Checking if docker is installed"
docker --version