
challenge = Challenge.new(node['clyde'], 7)
setup_challenge challenge

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "#{final_content(challenge)}\n\n"
end

