#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'gcc-multilib'
package 'libc6-i386'
package 'libc6-dev-i386'
package 'gdb'
package 'apache2'
package 'php5'

execute 'fs.protected_symlinks' do
  command "sysctl -w fs.protected_symlinks=0"
end

execute 'kernel.no_randomize_va_space' do
  command "echo 0 > /proc/sys/kernel/randomize_va_space"
end

directory '/tmp' do
  owner 'root'
  group 'root'
  mode  '01773'
end

cookbook_file '/etc/ssh/sshd_config' do
  source  'sshd_config'
  owner   'root'
  group   'root'
  mode    '0644'  
end

service 'apache2' do
  service_name  'apache2'
  provider      Chef::Provider::Service::Debian
  supports      [:start, :restart, :reload, :status]
  action        [:enable, :start]
end

cookbook_file '/etc/apache2/sites-available/000-default.conf' do
  source  '000-default.conf'
  owner   'root'
  group   'root'
  mode    '0644'
  notifies :reload, 'service[apache2]', :delayed  
end

compile '/usr/bin/envpos' do
  sources ['envpos.c']
  owner   'root'
  group   'root'
  mode    '0555'
end

file '/var/local/shellcode' do
  owner   'root'
  group   'root'
  mode    '0444'
  content '\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\x89\xc2\xb0\x0b\xcd\x80' + "\n"
end

file '/etc/legal' do
  owner   'root'
  group   'root'
  mode    '0644'
  content "\n"
end

cookbook_file '/etc/update-motd.d/99-wargame' do
  source  'motd.sh'
  owner   'root'
  group   'root'
  mode    '0755'
end

