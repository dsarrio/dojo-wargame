#
# Cookbook Name:: clyde
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# unlock home tree
execute 'clyde:unlock' do
  command "chattr -R -i /home/#{node['clyde']['challenge_name']}*"
  ignore_failure true
end

# load in reverse order for dependencies reason
include_recipe 'clyde::clyde07'
include_recipe 'clyde::clyde06'
include_recipe 'clyde::clyde05'
include_recipe 'clyde::clyde04'
include_recipe 'clyde::clyde03'
include_recipe 'clyde::clyde02'
include_recipe 'clyde::clyde01'
include_recipe 'clyde::clyde00'

# lock home tree
execute 'clyde:lock' do
  command "chattr -R +i /home/#{node['clyde']['challenge_name']}*"
end
