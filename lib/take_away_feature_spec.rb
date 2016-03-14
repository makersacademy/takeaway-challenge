require_relative 'dish'
require_relative 'menu'
require_relative 'my_order'
require_relative 'texter'

dish = Dish.new("Chicken Curry", 12.30)
menu = Menu.new
my_order = MyOrder.new(menu)
 menu

 dish

 dish.name
 dish.price
 dish.available
 "You ordered #{dish.name}, that will be #{'%.2f' % dish.price} pounds thank you"

menu.add_dish("Chicken Curry", 12.30)
menu.add_dish("Fish Curry", 11.30)
menu.add_dish("Lamb Curry", 13.30)
menu.add_dish("Fries", 2.30)
menu.add_dish("Salad", 7.30)
menu.add_dish("Naan", 3.30)
menu.add_dish("Pilau Rice", 1.30)
menu.add_dish("Plain Rice", 0.30)
menu.add_dish("Poppadom", 0.30)
menu.dishes

puts menu.show_menu
arr = []
menu.choose("Pilau Rice")



my_order.pick("Chicken Curry", 4)

puts "Your Order is"
#my_order.picks.each{|pick| print "#{pick[0].name} x #{pick[1]} \n"}
arr = 0

p my_order.picks
puts my_order.total
p my_order.menu.show_menu
#puts my_order.check_out



text = Text.new



#my_order.confirm_order
