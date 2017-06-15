
challenge = Challenge.new(node['clyde'], 2)
setup_challenge challenge

compile "#{challenge.homedir}/printfile" do
  sources ['printfile.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

file "#{challenge.homedir}/README" do
  owner     challenge.uid
  group     challenge.gid
  mode      '0400'
  content   "You should be able to understand what is the purpose of the program, but the real question is: HOW that program is doing the job ?\n\nhint: ltrace and man pages\n\n"
end

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "Password for #{challenge.next.username} is #{challenge.next.passwd}\n"
end

