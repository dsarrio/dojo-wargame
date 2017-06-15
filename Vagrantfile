# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 22, host: 4242
  config.vm.network "forwarded_port", guest: 80, host: 4280

  config.vm.define "wargame" do |wb|
  end
  
  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = ["chef/cookbooks"]
    chef.data_bags_path = "chef/data_bags"
    chef.roles_path = "chef/roles"
    chef.nodes_path = "chef/cookbooks"
    chef.environments_path = "chef/environments"
  
    chef.environment = "production"
    if ENV['ENVIRONMENT'] == 'dev'
        chef.environment = "development"
    end
    
    chef.add_recipe "common"
    chef.add_recipe "pinky"
    chef.add_recipe "clyde"
    chef.add_recipe "blinky"
  end
    
end
