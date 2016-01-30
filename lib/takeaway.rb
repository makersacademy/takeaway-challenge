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
	sum_total
	"Total cost\: £#{@total}"
	end

	def order_summary
    "Your order summary is:\n#{subtotal_of_items}\n #{total}"
	end






private

def sum_total
@order.each do |item|
	 		@dishes.select do |k,v| 
	 		@total += v	if k == item
			end
		end
	  @total
	 end
end

def subtotal_of_items
items = ""
subtotal = 0
duplicates = Hash.new(0)
    @order.each do |dish|
 	duplicates[dish] += 1
 	end	
 	duplicates.each do |k, v|
 		if items.empty?
 		subtotal+=(@dishes[k] * v)
  		items << " #{v} x #{k}, £#{subtotal}\n"
  		else
  		subtotal = 0
  		subtotal+=(@dishes[k] * v)
  		items << " #{v} x #{k}, £#{subtotal}\n" 
  		end	
	end
	items.chomp
end



def subtotal

end




# def select_item(item, amount=1)
# 		selection = @dishes.select {|k,v| k == item}
# 		@order.merge!(selection)
# 		"you added #{amount} #{item} to your basket"
# 	end