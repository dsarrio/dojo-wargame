
challenge = Challenge.new(node['clyde'], 5)
setup_challenge challenge

compile "#{challenge.homedir}/#{challenge.username}" do
  sources ['scanf_bof.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

cookbook_file "#{challenge.homedir}/#{challenge.username}.c" do
  source  'scanf_bof.c'
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

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "From now you will have to exploit buffer overflow vulnerabilities.\nBut it does not necessarily means that you have to use a shell code... at least not for #{challenge.name} course\n\nGood luck.\n\n"
end
