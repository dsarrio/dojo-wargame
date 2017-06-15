
define :setup_challenge do
  
  challenge = params[:name]
  
  # ----------------------------------------------------------------------------
  group challenge.username do
      gid       challenge.uid
      action    :create
  end
  
  # ----------------------------------------------------------------------------
  user challenge.username do
      comment     "#{challenge.name} level #{challenge.rank}"
      uid         challenge.uid
      gid         challenge.gid
      manage_home true
      action      :create
      home        challenge.homedir
      shell       '/bin/bash'
      password    challenge.passwd_crypted
  end
  
  # ----------------------------------------------------------------------------
  directory challenge.homedir do
    owner   'root'
    group   'root'
    mode    '0755'
    action  :create
  end 

  # ----------------------------------------------------------------------------
  cookbook_file "#{challenge.homedir}/.bash_logout" do
    source    'bash_logout'
    cookbook  'common'
    owner     'root'
    group     'root'
    mode      '0644'
  end
  
  # ----------------------------------------------------------------------------
  cookbook_file "#{challenge.homedir}/.bashrc" do
    source    'bashrc'
    cookbook  'common'
    owner     'root'
    group     'root'
    mode      '0644'
  end

  # ----------------------------------------------------------------------------
  cookbook_file "#{challenge.homedir}/.profile" do
    source    'profile'
    cookbook  'common'
    owner     'root'
    group     'root'
    mode      '0644'
  end

end
