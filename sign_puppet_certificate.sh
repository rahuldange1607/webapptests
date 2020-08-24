#!/bin/bash

echo "Listing all certificates"
ca_list=$(/opt/puppetlabs/bin/puppetserver ca list)
echo $ca_list

if [ "$ca_list" != "No certificates to list" ]; then
	echo "Signing all certificates"
	/opt/puppetlabs/bin/puppetserver ca sign --all
else
	echo "No certificates to sign"
fi
