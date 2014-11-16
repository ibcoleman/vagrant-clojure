Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.provision :shell, path: "bootstrap.sh"
	config.vm.synced_folder "c:/Users/icoleman/Projects", "/home/vagrant/Projects"
end

