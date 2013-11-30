Vagrant.configure("2") do |config|
  hostname = "workshop.pfz.nl"

  config.vm.box = "raring"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = hostname

  config.vm.network :private_network, ip: "192.168.56.155"
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--name", hostname]

    if (ENV['DEBUG']) then
      v.gui = true
    end
  end

  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root" 
  config.vm.provision :shell, :inline =>
    "if [[ ! -f /apt-get-run ]]; then sudo apt-get update && sudo touch /apt-get-run; fi"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "dev/puppet/manifests"
    puppet.module_path = "dev/puppet/modules"

    if (ENV['DEBUG']) then
      puppet.options = [
        '--verbose', 
        '--debug'
      ]
    end
  end
end
