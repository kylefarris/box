# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.define "base", primary: true do |base|
		base.vm.box_url = "http://labs.o3dev.com/box/base.box"
		base.vm.box = "base"
		base.vm.synced_folder ENV['HOME'] + "/sync", "/sync", create: true, type: "nfs"
		base.vm.network "private_network", ip: "192.168.200.2"
		base.vm.network "forwarded_port", guest: 80, host: 8080
		base.vm.network "forwarded_port", guest: 443, host: 8443
		base.vm.boot_timeout = 300
		base.vm.provider :virtualbox do |vb|
			vb.name = "base"
		end
	end

end
