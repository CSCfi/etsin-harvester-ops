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
  sudo pip install ansible==2.4.3.0
  sudo touch /vagrant_bootstrap_done.info
fi
cd /etsin/ansible && ansible-playbook site_provision.yml
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "etsin-metax" do |etsin|
    etsin.vm.box = "centos/7"
    etsin.vm.network :private_network, ip: "10.10.10.20"

    case RUBY_PLATFORM
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        # Fix Windows file rights, otherwise Ansible tries to execute files
        etsin.vm.synced_folder "./", "/etsin", :mount_options => ["dmode=755","fmode=644"]
    else
        # Basic VM synced folder mount
        etsin.vm.synced_folder "", "/etsin"
    end

    etsin.vm.provision "shell", inline: $script
    etsin.vm.provider "virtualbox" do |vbox|
        vbox.gui = false
        vbox.memory = 2048
    end
  end
end
