class Order

	attr_accessor :order_items

	def initialize
		@order_items = []
	end

	def item_count
		@order_items.count
	end

	def add_item(menu,item)
		order_items << menu.dishes.select{|dish| dish == item}.first
	end

	def order_total
		total = 0
		order_items.each do |order_item|
			total = total + order_item.price
		end
		total
	end

end