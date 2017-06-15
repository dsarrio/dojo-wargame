
default['clyde']['challenge_name'] = 'clyde'
default['clyde']['challenge_baseid'] = 11000
  
for i in 0..20
  default['clyde']['passwd']["#{i}"]  = "clyde#{i}"
end
