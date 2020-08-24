#!/bin/bash

echo "Listing all certificates"
/opt/puppetlabs/bin/puppetserver ca list > ca_list
ca_list_content = $(cat my_file.txt)
echo $ca_list_content

if [ "$ca_list_content" != "No certificates to list" ]; then
	echo "Signing all certificates"
	/opt/puppetlabs/bin/puppetserver ca sign --all
else
	echo "No certificates to sign"
fi
