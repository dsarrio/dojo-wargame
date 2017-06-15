#
# Cookbook Name:: blinky
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# unlock home tree
execute 'blinky:unlock' do
  command "chattr -R -i /home/#{node['blinky']['challenge_name']}*"
  ignore_failure true
end

# load in reverse order for dependencies reason
include_recipe 'blinky::blinky07'
include_recipe 'blinky::blinky06'
include_recipe 'blinky::blinky05'
include_recipe 'blinky::blinky04'
include_recipe 'blinky::blinky03'
include_recipe 'blinky::blinky02'
include_recipe 'blinky::blinky01'
include_recipe 'blinky::blinky00'

# lock home tree
execute 'blinky:lock' do
  command "chattr -R +i /home/#{node['blinky']['challenge_name']}*"
end
