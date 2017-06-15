
challenge = Challenge.new(node['pinky'], 2)
setup_challenge challenge

hiddenFile = "#{challenge.homedir}/.hidden"
file hiddenFile do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "#{challenge.next.passwd}\n"
end

execute 'lock' do
  command "chattr +i -R #{hiddenFile}"
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "Password to access next level is in an hidden file.\n\nhint: man ls\n\n"
end
