
challenge = Challenge.new(node['clyde'], 0)
setup_challenge challenge

compile "#{challenge.homedir}/check" do
  sources ['ltrace_strncmp.c']
  owner   challenge.next.uid
  group   challenge.gid
  mode    '4550'
end

file "#{challenge.homedir}/README" do
  owner     challenge.uid
  group     challenge.gid
  mode      '0400'
  content   <<-EOH
During this course you will have to exploit different binaries with suid bit set.
By doing so you will be granted with the password or to a shell with another user privileges.
Note that each level home directory contains the password for that same level.

Example: #{challenge.next.homedir}/.password is the password for #{challenge.next.username}

Some good tools for you to know: strings, ltrace, gdb, bash.
All man pages are available do not forget to use them !
    
If you have any issue tell me about on slack #wargames, #dsarrio

Good luck !

EOH
end

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "Password for #{challenge.next.username} is #{challenge.next.passwd}\n"
end
