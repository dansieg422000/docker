# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
   config.vm.box = "bento/ubuntu-16.04"
  # config.vm.box = "ubuntu/trusty64"
  # config.vm.box = "virtualBox"
  # config.ssh.username = "vagrant"
  # config.ssh.password = "vagrant"


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
   config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
   config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "10.0.2.15"
  # config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "/Users/ronal/vBox/folder_sync", "/folder_sync"
   config.vm.synced_folder "/elmo/tms-dev-vm/www/tms", "/var/www/tms"
   config.vm.synced_folder "/Users/ronal/vBox/react-app", "/var/www/react-app"
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
     vb.name = "ronald.VBox"
	 

     # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end
  
  # Sample Docker provision 
  # config.vm.provision :docker do |docker|
  #   docker.run "dansieg/apache:v1", args: "-d -v /var/www/tms:/var/www/tms --name apache-container"
  #   docker.run "dansieg/mysql:v1", args: "-d -e MYSQL_ROOT_PASSWORD=ronald --name mysql-container"
  ##   docker.run "mysql:latest", args: "-d -e MYSQL_ROOT_PASSWORD=ronald --name mysql-official MYSQL_DATABASE=elmo_dev"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: "sudo apt-get -y --fix-missing install --no-install-recommends ubuntu-desktop"
  # config.vm.provision "shell", path: "../vBox/install-nginx.sh"
  ## config.vm.provision "shell", path: "../vBox/install-gui.sh"
  # config.vm.provision "shell", path: "../vBox/install-node.sh"
  # config.vm.provision "shell", path: "../vBox/install-yarn.sh"
  # config.vm.provision "shell", path: "../vBox/install-react.sh"
  # config.vm.provision "shell", path: "../vBox/install-docker-ronald.sh"
  ## config.vm.provision "shell", path: "../vBox/install-docker-tms.sh"
  
  # Modified
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  
  # Host Name
  # config.vm.hostname = "local.elmotalent.com.au"
   config.vm.hostname = "ronald.olay.com"
end
