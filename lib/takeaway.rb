require "./lib/menu"

class Takeaway

attr_reader :order

	def initialize
	@menu = Menu.new
	@dishes = @menu.dishes
	@order = []
	end

	def list_menu
	@dishes
	end

	def select_item(item, amount=1)
		amount.times {order << item} 
		"you added #{amount} #{item} to your basket"
	end



end

# def select_item(item, amount=1)
# 		selection = @dishes.select {|k,v| k == item}
# 		@order.merge!(selection)
# 		"you added #{amount} #{item} to your basket"
# 	end