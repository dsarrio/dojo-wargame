
challenge = Challenge.new(node['clyde'], 4)
setup_challenge challenge

compile "#{challenge.homedir}/#{challenge.username}" do
  sources ['ls_injection.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

cookbook_file "#{challenge.homedir}/#{challenge.username}.c" do
  source  'ls_injection.c'
  owner   challenge.uid
  group   challenge.gid
  mode    '0400'
end

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "#{challenge.next.passwd}\n"
end
