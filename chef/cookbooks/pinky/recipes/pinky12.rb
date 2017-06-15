
challenge = Challenge.new(node['pinky'], 12)
setup_challenge challenge

file "#{challenge.homedir}/README" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0640'
  content "#{final_content(challenge)}\n\n"
end
