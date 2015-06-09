name "head"
description "Valpa role for the head node"
all_env = [ 
  "role[base]",
  "recipe[valpa::head_node]",
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "prod" => all_env,
  #"dev" => all_env + ["recipe[php:module_xdebug]"],
  "dev" => all_env,
)

#override_attributes({
#  "python" => {"version" => "3.4.0"}   
#})

