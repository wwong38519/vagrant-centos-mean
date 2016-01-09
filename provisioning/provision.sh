#!/bin/bash

sudo yum update
sudo service sshd start

chmod +x /vagrant/provisioning/*.sh
/vagrant/provisioning/timezone.sh
/vagrant/provisioning/locale.sh
/vagrant/provisioning/mean.sh

