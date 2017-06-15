
define :compile, :sources => nil, :owner => nil, :group => nil, :mode => nil, :debug => false do
  
  target = params[:name]
  sources = params[:sources]
    
  cache_sources = Array.new

  def tmp_file(_src)
    return "#{Chef::Config['file_cache_path']}/#{_src}"
  end

  # copy files to cache    
  sources.each do |src|
    cookbook_file tmp_file(src) do
        source src
    end
    cache_sources.push(tmp_file(src))
  end
  
  # compile them
  bash target do
    cwd     File.dirname(target)
    code    "gcc #{params[:debug]? '-g' : ''} -m32 -fno-stack-protector -Wl,-z,norelro,-z,execstack -mpreferred-stack-boundary=4 -o #{File.basename(target)} #{cache_sources.join(' ')}"
  end

  # correct rights
  file target do
    owner params[:owner]
    group params[:group]
    mode  params[:mode]
  end
  
end
