
default['blinky']['challenge_name'] = 'blinky'
default['blinky']['challenge_baseid'] = 12000
  
for i in 0..20
  default['blinky']['passwd']["#{i}"]  = "blinky#{i}"
end
