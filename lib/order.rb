require './lib/menu.rb'

class Order

	attr_accessor :dishes_ordered, :dish_count, :order_total

	def initialize
		@dishes_ordered = {}
		@order_total = 0
		@dish_count = 0
	end	


	def add_items_to_order (dish, quantity)
		fail "Order something on the menu!" unless ((Menu.new).menu_items).has_key? dish
		@dishes_ordered[dish] = quantity
		@dish_count = @dish_count + quantity
		#quantity.times {dishes_ordered << dish}
		# order_total = quantity * price_per_dish
	end

	def sum
  	total = 0
  	if @dishes_ordered.each { |dish, quantity| total += (Menu.new).menu_items[dish] * quantity } 
  	order_total << total
    else
    return 'Calculation error!'
  	end
  end


end