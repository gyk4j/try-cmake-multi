# -*- mode: ruby -*-
# vi: set ft=ruby :

# Created using `vagrant init -m ubuntu/jammy64`

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade -y
    apt-get install -y gcc-multilib libc6-i386 libc6-dev-i386
  SHELL
end
