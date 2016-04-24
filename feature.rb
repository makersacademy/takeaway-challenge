require_relative './lib/takeaway'
require_relative './lib/menu'
require_relative './lib/order_log'
require_relative './lib/menu_item'
require_relative './lib.sms.rb'


thai_menu = Menu.new

puts thai_menu.show

thai_menu.add "kung-po", 7
thai_menu.add "chop-suey", 5
thai_menu.add "egg phoo yung", 6

puts thai_menu.show

puts

thai_menu.remove "kung-po"
puts thai_menu.show
puts

thai_restaurant = Takeaway.new(thai_menu)

p thai_restaurant


# fergus = OrderLog.new thai_menu
#
# puts fergus.show
# puts
# fergus.add "egg phoo yung", 2
# fergus.add "chop-suey", 5
#
# puts fergus.show
# puts
# fergus.remove "egg phoo yung", 1
#
# puts fergus.show
# puts
#
# thai_menu.add "cheese_on_toast", 3.5
#
# fergus.add "cheese_on_toast"
#
# puts fergus.show
# puts
#
# puts fergus.total
