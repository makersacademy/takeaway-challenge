require_relative 'menu'
require 'twilio-ruby'

class Order < Menu

	attr_reader :order

	def initialize
		@order = {}
		@menu_keys = menu_list.keys
		@menu_values = menu_list.values
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
		fail "Total cost is incorrect" if sum != total_cost
		puts "TOTAL COST - £#{total_cost}" 
	end

	def place_order
		fail "No order has been entered" if order == {}
		send_text
	end

	def send_text
		system("ruby text.rb")
	end

end