Vagrant::Config.run do |config|

  # Your organization name for hosted Chef
  orgname = "gmcevoy" 

  # Common chef variables
  chef_server_url = "https://api.opscode.com/organizations/#{orgname}"
  validation_key_path = "#{ENV['HOME']}/.chef/#{orgname}-validator.pem"
  validation_client_name = "#{orgname}-validator"
  encrypted_data_bag_secret_key_path = "#{ENV['HOME']}/.chef/encrypted_data_bag_secret"

  # Valpa Head VM
  config.vm.define "head" do |head|
    head.vm.box = "chef/ubuntu-14.04"
    head.vm.forward_port 80, 8080

    head.vm.customize [
      "modifyvm", :id,
      "--name", "head-vm",
      "--memory", "1024"
    ]

    head.vm.network :hostonly, "10.0.0.23"
    head.vm.host_name = "head-vm"

    # Set Chef node ID for this VM
    node = "vagrant-head-#{ENV['USER']}"

    head.vm.provision :chef_client do |chef|
      chef.chef_server_url = "#{chef_server_url}"
      chef.validation_key_path = "#{validation_key_path}"
      chef.validation_client_name = "#{validation_client_name}"
      chef.encrypted_data_bag_secret_key_path = "#{encrypted_data_bag_secret_key_path}"
      chef.node_name = "#{node}"
      chef.provisioning_path = "/etc/chef"
      #chef.log_level = :debug
      chef.log_level = :info

      chef.environment = "dev" 
      chef.add_role("head")
   
      chef.delete_node = true
      chef.delete_client = true
    end
  end 
end
