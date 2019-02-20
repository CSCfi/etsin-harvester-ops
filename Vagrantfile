# -*- mode: ruby -*-
# vi: set ft=ruby :


# Pre-provisioner shell script installs Ansible into the guest and continues
# to provision rest of the system in the guest. Works also on Windows.
$script = <<SCRIPT
if [ ! -f /vagrant_bootstrap_done.info ]; then
  sudo yum update
  sudo yum -y install epel-release python-devel libffi-devel openssl-devel git gcc
  sudo yum -y install python-pip
  sudo pip install pip --upgrade
  sudo pip install ansible
  sudo touch /vagrant_bootstrap_done.info
fi
cd /etsin/ansible && ansible-playbook site_provision.yml
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "etsin-metax" do |etsin|
    etsin.vm.box = "centos/7"
    etsin.vm.network :private_network, ip: "10.10.10.20"

    # Basic VM synced folder mount
    etsin.vm.synced_folder "./ansible", "/etsin/ansible"
    etsin.vm.synced_folder "./sources", "/etsin/sources", create: true

    etsin.vm.provision "shell", inline: $script
    etsin.vm.provider "virtualbox" do |vbox|
        vbox.gui = false
        vbox.memory = 2048
    end
  end
end
