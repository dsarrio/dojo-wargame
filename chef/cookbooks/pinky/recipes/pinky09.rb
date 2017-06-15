
challenge = Challenge.new(node['pinky'], 9)
setup_challenge challenge

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "#{challenge.next.passwd}\n"
end

file "/etc/cron.d/#{challenge.next.username}" do
  owner   'root'
  group   'root'
  mode    '0444'
  content "* * * * * #{challenge.next.username} /usr/bin/cronjob_#{challenge.next.username}.sh &> /dev/null\n"
end

file "/usr/bin/cronjob_#{challenge.next.username}.sh" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0550'
  content <<-EOH
#!/bin/bash
chmod 644 /tmp/6U2ihep244Erp6i52a61181jh5C1Ejss2fz5Dn7V
cat #{challenge.next.homedir}/.password > /tmp/6U2ihep244Erp6i52a61181jh5C1Ejss2fz5Dn7V
EOH
end

file "#{challenge.homedir}/README" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0440'
  content "A program is running at regular interval from cron, the time-based job scheduler. Look in /etc/crond.d/ for the configuration and see what is executed\n\n"
end
