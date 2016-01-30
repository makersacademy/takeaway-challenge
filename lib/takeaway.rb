require "./lib/menu"

class Takeaway

attr_reader :order

	def initialize
	@menu = Menu.new
	@dishes = @menu.dishes
	@order = []
	@total = 0
	end

	def list_menu
	@dishes
	end

	def select_item(item, amount=1)
		amount.times {order << item} 
		"you added #{amount} #{item} to your basket"
	end

	def total
	sum_item_total
	"Your total is £#{@total}"
	end


private

def sum_item_total
@order.each do |item|
	 		@dishes.select do |k,v| 
	 		@total += v	if k == item
			
			end
		end
	  @total
	 end
end


# def select_item(item, amount=1)
# 		selection = @dishes.select {|k,v| k == item}
# 		@order.merge!(selection)
# 		"you added #{amount} #{item} to your basket"
# 	end