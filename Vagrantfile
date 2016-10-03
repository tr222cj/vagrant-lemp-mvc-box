Vagrant.configure(2) do |config|

	# Specify base box
	config.vm.box = "bento/ubuntu-16.04"
	
	# Setup port forwarding
	config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

	# Configure synced folders
	config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"
	
	# Provision
	config.vm.provision "shell" do |s|
		s.path = ".provision/setup.sh"
	end
end