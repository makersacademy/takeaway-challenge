require_relative 'takeaway'
require 'twilio-ruby'

takeaway = Takeaway.new
p takeaway.menu


p takeaway.select_items({rice:3, pea:5})
#p takeaway.place_order({rice:3, pea:5},65)


hash = {a: 1}
strash = "{a:1}"
p eval(strash).empty?

begin eval(strash)
  puts "yep"
rescue Exception => exc
  puts "nope"
end
