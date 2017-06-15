
challenge = Challenge.new(node['pinky'], 6)
setup_challenge challenge

template "#{challenge.homedir}/data.txt" do
  source  '20last_chars.erb'
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0640'
  
  variables({
    :revpasswd  => challenge.next.passwd.reverse
  })
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "Password for #{challenge.next.username} is the 20 last characters in reverse order of the line containing 236 characters in file data.txt\n\n"
end
