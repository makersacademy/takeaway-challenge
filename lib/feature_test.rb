 require_relative 'menu'
 require_relative 'order'
 require_relative 'takeaway'
 require_relative 'dish'
 require_relative 'sms'

#Initialize objects
sms = SMS.new
dish =  Dish.new
dish2 = Dish.new("Gomo Gomo No", 2000)
menu = Menu.new
takeaway = TakeAway.new(menu)
order = Order.new
i = 1
dish_array = 20.times { 
	menu.add_dish(i,"Google#{i}", rand(20))
	i += 1
}

#Scenario_01
# menu.add_dish(1, "Sashimi", 6.20)
# menu.add_dish(3, "Goreng", 6.20)
# takeaway.read_menu
# takeaway.menu.dishes
# p menu.dishes["1"]
# takeaway.add_order(1, 2)
# takeaway.add_order(3, 3)
# takeaway.order_summary
# p takeaway.order.total.to_i
# p takeaway.format_user_total(31.00)
# p takeaway.verify(31.00)
p takeaway.confirm_order(30.00)
# p sms.time
# p sms.delivery_time


#Experiment
# puts "%.2f" % 2
# p dish.price
# p dish.money
