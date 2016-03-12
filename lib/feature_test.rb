require_relative 'takeaway'


takeaway = Takeaway.new
p takeaway.menu
realmenu = takeaway.menu

order = {rice: 3, pea: 2}

order.each{|k,v| realmenu[k] * v}

p order.map{|k,v| v * realmenu[k] if realmenu.key? k}.reduce(:+)
p ENV['LOAD_PATH']
