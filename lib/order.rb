require_relative './menu.rb'

class Order

	attr_reader :order

		@price_list = {
		"fried eggs with bacon" => 6.00,
		"eggs benedict with avocado" => 7.50,
		"scrambled eggs with mozzarella" => 7.00,
		"pancakes with chocolate" => 7.50,
		"yoghurt with fresh fruit" => 6.00
  }

	@order = {}

	def select_items(item, num_of_portions)
		if available?(item)
			@order[item] = num_of_portions
		else
			raise
		end
	end

	def available?(item)
		@price_list[item]
	end

end