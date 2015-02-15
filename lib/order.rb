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

end