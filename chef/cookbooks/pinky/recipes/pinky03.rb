
challenge = Challenge.new(node['pinky'], 3)
setup_challenge challenge

archive = "#{Chef::Config['file_cache_path']}/search_on_size.tgz"
cookbook_file archive do
    source 'search_on_size.tgz'
end

bash 'extract_archive' do
  cwd  challenge.homedir
  code <<-EOH
    tar xvzf #{archive}
    chown -R root:#{challenge.uid} data
    chmod -R 0750 data
    EOH
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "You are looking for a 1042 bytes file in data folder\n\nhint: May the find be with you :)\n\n"
end
