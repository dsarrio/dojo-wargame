#
# Cookbook Name:: pinky
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# unlock home tree
execute 'pinky:unlock' do
  command "chattr -R -i /home/#{node['challenge_name']}*"
  ignore_failure true
end

# load in reverse order for dependencies reason
include_recipe 'pinky::pinky12'
include_recipe 'pinky::pinky11'
include_recipe 'pinky::pinky10'
include_recipe 'pinky::pinky09'
include_recipe 'pinky::pinky08'
include_recipe 'pinky::pinky07'
include_recipe 'pinky::pinky06'
include_recipe 'pinky::pinky05'
include_recipe 'pinky::pinky04'
include_recipe 'pinky::pinky03'
include_recipe 'pinky::pinky02'
include_recipe 'pinky::pinky01'
include_recipe 'pinky::pinky00'

# lock home tree
execute 'pinky:lock' do
  command "chattr -R +i /home/#{node['challenge_name']}*"
end
