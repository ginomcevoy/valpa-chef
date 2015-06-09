# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "gmcevoy"
client_key               "#{current_dir}/gmcevoy.pem"
validation_client_name   "gmcevoy-validator"
validation_key           "#{current_dir}/gmcevoy-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/gmcevoy"
cookbook_path            ["#{current_dir}/../cookbooks"]

cookbook_copyright       "Giacomo Mc Evoy"
cookbook_email           "giacomo@lncc.br"
cookbook_license         "apachev2"

