
challenge = Challenge.new(node['pinky'], 7)
setup_challenge challenge

file "#{challenge.homedir}/data.txt" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   `echo "#{challenge.next.passwd}" | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'`
end

file "#{challenge.homedir}/README" do
  owner     challenge.next.uid
  group     challenge.gid
  mode      '0640'
  content   "rot13 or roTR13 ?\n\n"
end
