require_relative 'menu'
require_relative 'send_sms'
class Order
	attr_accessor :list_dishes, :total_dishes
	def initialize(menu = Menu.new, total_dishes = {}, send_sms = SendOrder.new)
		@list_dishes = menu
		@total_dishes = total_dishes
		@send_sms = send_sms
	end

	def add(dish, quantity = 1)
		@total_dishes.store(dish, quantity)
	end

	def check
		order_check = ''
		total = 0
		@total_dishes.each do |dish, quantity|
			@list_dishes.each do |dishes_menu, price|
				if dish == dishes_menu
					order_check << "#{dish} - #{quantity} || "
					total += quantity * price
				end
			end
		end
		order_check << "Your total is #{total} £"
	end

	def send
	end
end