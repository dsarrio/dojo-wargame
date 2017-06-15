
challenge = Challenge.new(node['pinky'], 10)
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

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying #{challenge.next.homedir}/.password to /tmp/$mytarget"

cat #{challenge.next.homedir}/.password > /tmp/$mytarget
EOH
end

file "#{challenge.homedir}/README" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0440'
  content "A program is running at regular interval from cron, the time-based job scheduler. Look in /etc/crond.d/ for the configuration and see what is executed\n\n"
end
