Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.provision :shell, path: "bootstrap.sh"
	config.vm.synced_folder "c:/Users/icoleman/Projects", "/usr/local/Projects"
	config.vm.network "forwarded_port", guest: 3000, host: 3000
	config.vm.provider :virtualbox do |vb|
	   vb.customize ["modifyvm", :id, "--memory", "4096"]
	end
end

