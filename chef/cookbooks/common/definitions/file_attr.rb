define :file_attr, :mode => '', :recursive => false do
  
    execute "file_attr #{params[:name]}" do
      command "chattr #{mode} #{ params[:recursive] ? '-R': '' } #{params[:name]}"
    end
  
end