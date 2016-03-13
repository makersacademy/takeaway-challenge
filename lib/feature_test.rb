require_relative 'takeaway'
require 'twilio-ruby'

takeaway = Takeaway.new
p takeaway.menu


p takeaway.select_items({rice:3, pea:5})
p takeaway.place_order({rice:3, pea:5},65)


hash = {a: 1}
incoming = "{a:2}"
#p eval(strash).empty?

begin order = eval(incoming)
  if order.empty?
    p "Your order contained no items."
  else
    puts SMSMessage.new.format_order(order)
  end
rescue Exception => exc
  p "Please submit a valid order."
end
