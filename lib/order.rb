require_relative 'menu'

class Order
	def initialize *args
		@order = []
		@total = 0
		args.each do |a|
			@order << Menu::DISHES[a-1][0]
			@total += Menu::DISHES[a-1][1]
		end
		p @total.round(2)
	end
end

# p o = Order.new(5,8)