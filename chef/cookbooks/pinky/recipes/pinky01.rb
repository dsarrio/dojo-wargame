
challenge = Challenge.new(node['pinky'], 1)
setup_challenge challenge

file "#{challenge.homedir}/-" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "#{challenge.next.passwd}\n"
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "Password to access next level is in file named with just a dash, but that character is often used as command parameter to specify standard input instead of a file.\n\n"
end
