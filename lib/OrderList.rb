class OrderList

	attr_reader :items, :menu_list

	def initialize(menu_item_list, list_of_order_numbers)
		@items = list_of_order_numbers
		@menu_list = menu_item_list
	end


	def total
		arr = []
		items.each { |i| arr << menu_list.price(i) }
		arr.sum
	end

end