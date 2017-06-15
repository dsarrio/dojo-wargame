
class Challenge
    
  attr_reader :name
  attr_reader :rank
  
  def initialize(attributes, rank)
    @attrs = attributes
    @name = @attrs['challenge_name']
    @base_id = @attrs['challenge_baseid']
    @passwds = @attrs['passwd']
    @rank = rank
  end

  def next
    @next ||= Challenge.new(@attrs, @rank + 1)
  end
  
  def username
    return @name + @rank.to_s
  end
  
  def passwd
    return @passwds["#{@rank}"]
  end
  
  def uid
    return @base_id + @rank
  end
  
  def gid
    return uid
  end
  
  def homedir
    return '/home/' + username
  end
  
  def passwd_crypted
    return `openssl passwd -1 #{passwd} | xargs echo -n`
  end
  
  def next_course
    return @attrs['next_course']
  end
  
end


def isLocked(path)
  attrs = `lsattr #{path} | cut -c-16 | xargs echo -n`
  return attrs == '----i--------e--'
end

def final_content(challenge)
  nc = challenge.next_course
  if nc.nil?
    return 'Congratulations you ended this course !'
  end
  
  return  <<-EOH
Congratulations you ended this course !
You can start the next one right now by login to #{nc['username']} with password #{nc['passwd']}
  EOH
end
