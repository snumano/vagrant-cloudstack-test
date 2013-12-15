# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

#  config.ssh.username = "vagrant"
  config.ssh.username = "root"
  config.ssh.private_key_path = "~/.ssh/id_rsa"
  config.ssh.port = "2222"

  config.vm.box = "dummy"
  config.vm.box_url = "https://github.com/klarna/vagrant-cloudstack/raw/master/dummy.box"

  config.vm.provider :cloudstack do |cloudstack, override|
    cloudstack.scheme = "https"
    cloudstack.host = "api.noahcloud.jp"
    cloudstack.port = "443"
    cloudstack.path = "/portal/client/api"
    cloudstack.api_key = "*****"
    cloudstack.secret_key = "*****"

    cloudstack.template_id = "2212"
    cloudstack.service_offering_id = "24"
    cloudstack.zone_id = "2"
    cloudstack.keypair = "*****"

    cloudstack.pf_ip_address_id = "*****"
    cloudstack.pf_public_port = "2222"
    cloudstack.pf_private_port = "22"

    cloudstack.instance_ready_timeout = 1800
  end

  # Chef-solo
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest


  config.vm.provision :shell do |shell|
    shell.path = "scripts/script.sh"
    shell.args = "vagrant"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "rvm::system"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "myapp"

    chef.json = {
      "rvm" => {
        "default_ruby" => "ruby-1.9.3-p448",
        "global_gems" => [
          {"name" => "bundler"}
        ]
      }
    }
  end
end
