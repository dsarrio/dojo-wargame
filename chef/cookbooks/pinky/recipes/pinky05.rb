
challenge = Challenge.new(node['pinky'], 5)
setup_challenge challenge

template "#{challenge.homedir}/data.txt" do
  source  'unique_line.erb'
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0640'
  
  variables({
    :password  => challenge.next.passwd
  })
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "Password for #{challenge.next.username} is the only line of text that occurs only once in file data.txt\n\nhint: cat are sort as uniq strange pets\n\n"
end
