# Installation

Instructions: http://docs.ansible.com/ansible/latest/intro_installation.html

## Ubuntu

``` bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

## MacOS

``` bash
sudo easy_install pip
sudo pip install ansible
```

# Getting Started

`ansible --version`

vagrant init ubuntu/bionic64

vagrant up
vagrant reload

vagrant ssh
vagrant ssh-config

ssh vagrant@127.0.0.1 -p 2222 -i ./.vagrant/machines/default/virtualbox/private_key

hosts file:

testserver ansible_host=127.0.0.1 ansible_port=2222 ansible_user=vagrant ansible_private_key_file=.vagrant/machines/default/virtualbox/private_key

ansible testserver -i hosts -m ping

Ansible looks for an ansible.cfg file in the following places, in this order:

1. File specified by the ANSIBLE_CONFIG environment variable 
2. ./ansible.cfg (ansible.cfg in the current directory)
3. ~/.ansible.cfg (.ansible.cfg in your home directory)
4. /etc/ansible/ansible.cfg

ansible testserver -m command -a uptime
ansible testserver -a uptime
ansible testserver -a "tail /var/log/dmesg"

# to become root -b
ansible testserver -b -a "tail /var/log/syslog"

ansible testserver -b -m apt -a "name=nginx update_cache=yes"
ansible testserver -b -m service -a "name=nginx state=restarted"
