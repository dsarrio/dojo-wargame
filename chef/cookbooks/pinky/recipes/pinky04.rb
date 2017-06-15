
challenge = Challenge.new(node['pinky'], 4)
setup_challenge challenge

file "/var/lib/dpkg/#{challenge.next.username}.passwd" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "#{challenge.next.passwd}\n"
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "This time you are looking a 21 bytes file on the whole file system, to help you the file is also owned by #{challenge.next.username}.\n\nhint: may the find be still with you :)\n\n"
end
