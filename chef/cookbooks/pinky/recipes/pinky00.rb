
challenge = Challenge.new(node['pinky'], 0)
setup_challenge challenge

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "Password to access next level ( #{challenge.next.username} ) is #{challenge.next.passwd}\nYou can ssh to that user right now to reach next level, but it will not be as easy all the time ;)\n\n"
end
