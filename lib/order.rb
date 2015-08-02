require_relative './menu.rb'

class Order

#This is the restaurant order logic

	attr_accessor :dishes_ordered, :dish_count

	def initialize
		@dishes_ordered = []
		@order_total = 0
		@dish_count = 0
	end	


	def add_items_to_order (dish, quantity)
		@dish_count = @dish_count + quantity
		quantity.times {dishes_ordered << dish}
	end


	def calculate_order_total (menu)
		dishes_ordered.each do |dish|
			@order_total += menu.menu_items.fetch(item)
		end
	end	















end