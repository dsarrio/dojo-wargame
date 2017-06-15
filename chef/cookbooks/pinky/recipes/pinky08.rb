
challenge = Challenge.new(node['pinky'], 8)
setup_challenge challenge

package 'xinetd'
service 'xinetd' do
  service_name 'xinetd'
  supports [:start, :restart, :reload, :status]
  action [:enable, :start]
end

cookbook_file '/usr/bin/pinky_nextpass_if_eq' do
  source  'nextpass_if_eq'
  owner   'root'
  group   'root'
  mode    '0755'
end

template "/etc/xinetd.d/#{challenge.username}" do
  source    'xinetd_service.erb'
  cookbook  'common'
  owner     'root'
  group     'root'
  mode      '0600'
  
  variables({
    :service_name     => "#{challenge.username}",
    :service_port     => 10000,
    :service_cmd      => '/usr/bin/pinky_nextpass_if_eq',
    :service_cmd_args => "#{challenge.passwd} #{challenge.next.passwd}"
  })
  
  notifies :reload, 'service[xinetd]', :delayed 
end

file "#{challenge.homedir}/README" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0640'
  content "Send current level password to the server listening on port 10000\n\nhint: tel the net OR net the cat ?!!\n\n"
end
