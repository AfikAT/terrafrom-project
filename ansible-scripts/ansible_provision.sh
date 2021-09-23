#!/bin/bash

##Checking if ansible installed on the system##
pip list | grep -i ansible > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "ansible installed"
else
	echo "Ansible is not installed, installing ansible..."
  	sudo apt-get update
  	sudo apt-get install python3-pip -y
  	sudo pip3 install virtualenv docker ansible
fi

##ADD ec2 ip to inventory##
#current_dir="`dirname \"$0\"`"
sed -i "/ec2_hosts/a ${public_ip}" ./inventory.ini

##Run Ansible playbook##
/usr/local/bin/ansible-playbook -i ./inventory.ini ./playbook.yaml
