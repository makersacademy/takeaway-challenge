require_relative "./menu.rb"
require_relative "./message.rb"

class Restaurant 

	 attr_reader :menu, :basket

	 def initialize
 		 @menu = Menu.new
 		 @basket = {}
 	end

	 def show_menu
 		 @menu.read_menu
 	end

	 def add_order(name, quantity = 1)
 		 @basket[name] = quantity, order_price(name, quantity)
 		 "You have ordered #{quantity} #{name.capitalize}(s) at a price of $#{order_price(name, quantity)}"
 	end

	 def order_price(name, quantity = 1)
 		 (menu.dishes[name] * quantity).round(2)
 	end

	 def basket_summary
 		 basket.each do |x, y| 
 			  puts "You have ordered #{y[0]} #{x} for £#{y[1]}"
 		 end
 	end

	 def cost_of_each
 		 basket.values.map { |x| x[-1] }
 	end

	 def total
 		 amount = cost_of_each.reduce(:+).round(2)
 		 return "The total cost of your food is $#{amount}"

 	end

	 def remove_dish(dish)
 		 basket.delete(dish)
 	end

	 def edit_order(_dish, quantity = 1)
 		 add_order(item, quantity)
 	end

	 def order_correct?(price)
 	  total == price
 	end

	 def complete_order(price)
 	  if order_correct?(price)
   	  sms_message = Message.new(price)
   	  sms_message.send_sms
   	else
   	  "Please review your order"
   	end
 	end
end

r = Restaurant.new
menu = Menu.new
# p r.order_price("dodo egg", 3)
p r.add_order("dodo egg", 2)
p r.add_order("rex steak", 3)
# p r.basket
p r.basket_summary
p r.total
r.complete_order(24.95)
