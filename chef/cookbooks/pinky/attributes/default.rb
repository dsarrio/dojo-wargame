
default['pinky']['challenge_name'] = 'pinky'
default['pinky']['challenge_baseid'] = 10000
  
for i in 0..20
  default['pinky']['passwd']["#{i}"]  = "pinky#{i}"
end
