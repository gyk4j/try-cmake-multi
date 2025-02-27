# -*- mode: ruby -*-
# vi: set ft=ruby :

# Created using `vagrant init -m ubuntu/jammy64`

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade -y
    apt-get install -y build-essential cmake gcc-multilib g++-multilib
  SHELL
end
