
challenge = Challenge.new(node['blinky'], 1)
setup_challenge challenge

compile "#{challenge.homedir}/#{challenge.username}" do
  sources ['std_shellcode.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

cookbook_file "#{challenge.homedir}/#{challenge.username}.c" do
  source  'std_shellcode.c'
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
