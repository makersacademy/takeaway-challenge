class Order

	attr_accessor :order_items

	def initialize
		@order_items = []
	end

	def total_item_count
		@order_items.count
	end

	def add_item(menu,item)
		order_items << menu.dishes.select{|dish| dish == item}.first
	end

	def order_total
		total = 0
		order_items.each{|order_item|total = total + order_item.price}	
		total
	end

	def item_count(item)
 order_items.select{|order_item| order_item == item}.count
	end

	def order_total_check(total)
		raise 'Order total is wrong' if total != order_total
	end

end