class Order

	attr_reader :food_list, :menu

	def initialize(menu)
		@food_list = {}
		@menu = menu
	end

	def add(item, quantity)
		fail "Item is not on the menu" unless menu.has_item?(item)
		food_list.store(item,quantity)
	end



end
