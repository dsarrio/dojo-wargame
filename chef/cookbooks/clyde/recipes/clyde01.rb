
challenge = Challenge.new(node['clyde'], 1)
setup_challenge challenge

compile "#{challenge.homedir}/#{challenge.username}" do
  sources ['printlink.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "Password for #{challenge.next.username} is #{challenge.next.passwd}\n"
end


