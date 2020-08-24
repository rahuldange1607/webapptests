#!/bin/bash

echo "Listing all certificates"
/opt/puppetlabs/bin/puppetserver ca list

echo "Signing all certificates"
/opt/puppetlabs/bin/puppetserver ca sign –all