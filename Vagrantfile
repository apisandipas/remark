# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ruby"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.66"

  # Make VM available as another physical device in the network
  # config.vm.network :public_network

  config.vm.provider :virtualbox do |vb|
    # Set VM memory limit (1GB)
    vb.customize ["modifyvm", :id, "--memory", "1024"]

    # Allow symlinks creation
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Share your working directory with VM
  config.vm.synced_folder "./", "/home/apps/www/current", { owner: "apps", group: "apps" }
end
