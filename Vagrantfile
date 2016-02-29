Vagrant.configure(2) do |config|
	config.vm.box = "martin-v/debian-jessie-libvirt"
	config.vm.hostname = "letsencrypttest"

	config.vm.provision "shell", inline: "/vagrant/tests/run_tests.sh"
end
