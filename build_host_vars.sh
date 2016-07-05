#!/bin/bash
#Purpose: To build the ansible hostvars

while read ip_address <&3 && read host_name <&4; do

echo -e "ansible_connection: ssh \nansible_ssh_host: $ip_address \nansible_ssh_user: root \nansible_ssh_private_key_file: private_key" > ./host_vars/"$host_name"

done 3< /tmp/ipaddress 4< /tmp/hostname
