
challenge = Challenge.new(node['pinky'], 11)
setup_challenge challenge

file "#{challenge.next.homedir}/.password" do
  owner     challenge.next.uid
  group     challenge.next.gid
  mode      '0400'
  content   "#{challenge.next.passwd}\n"
end

# -----------------------------------------------------------------------------
# Setup cron task for next user
# -----------------------------------------------------------------------------
file "/etc/cron.d/#{challenge.next.username}" do
  owner   'root'
  group   'root'
  mode    '0444'
  content "* * * * * #{challenge.next.username} /usr/bin/cronjob_#{challenge.next.username}.sh &> /dev/null\n"
end

directory "/var/spool/#{challenge.next.username}" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0777'
end

file "/usr/bin/cronjob_#{challenge.next.username}.sh" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0550'
  content <<-EOH
#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname
echo "Executing and deleting all scripts in /var/spool/$myname:"
for i in * .*;
do
  if [ "$i" != "." -a "$i" != ".." ];
  then
    echo "Handling $i"
    timeout -s 9 60 "./$i"
    rm -f "./$i"
  fi
done
EOH
end

# -----------------------------------------------------------------------------
# Setup cron task for root to clean up folder
# -----------------------------------------------------------------------------
file "/etc/cron.d/#{challenge.next.username}_root" do
  owner   'root'
  group   'root'
  mode    '0444'
  content "* * * * * root /usr/bin/cronjob_#{challenge.next.username}_root.sh &> /dev/null\n"
end

file "/usr/bin/cronjob_#{challenge.next.username}_root.sh" do
  owner   'root'
  group   'root'
  mode    '0500'
  content <<-EOH
#!/bin/bash
rm -f "/var/spool/#{challenge.next.username}/*"
EOH
end

# -----------------------------------------------------------------------------
# readme file
# -----------------------------------------------------------------------------
file "#{challenge.homedir}/README" do
  owner   challenge.next.uid
  group   challenge.gid
  mode    '0440'
  content "A program is running at regular interval from cron, the time-based job scheduler. Look in /etc/crond.d/ for the configuration and see what is executed\n\n"
end
