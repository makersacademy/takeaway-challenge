require_relative 'menu'

class Order < Menu

	attr_reader :order, :correct_cost

	def initialize
		@order = {}
		@menu_keys = menu_list.keys
		@menu_values = menu_list.values
		@correct_cost = true
	end

	def new_order(list,total_cost)
		count = 0
		puts "ORDER SUMMARY"
		list.each do |x,y|
			dish = menu_keys[x - 1]
			cost = menu_values[x - 1] * y
			puts "#{list.index([x,y])+1}. #{dish}   x #{y}   £#{cost}"
			order.merge!({dish => cost})
		end
		sum = 0
		order.values.each {|a| sum += a }
		if sum != total_cost
			correct_cost = false
			fail "Total cost is incorrect"
		end
		puts "TOTAL COST - £#{total_cost}"
	end

	def place_order
		fail "No order has been entered" if order == {}
	end

end