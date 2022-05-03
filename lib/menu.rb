class Menu

	def initialize
		@price_list = {
		"fried eggs with bacon" => 6.00,
		"eggs benedict with avocado" => 7.50,
		"scrambled eggs with mozzarella" => 7.00,
		"pancakes with chocolate" => 7.50,
		"yoghurt with fresh fruit" => 6.00
  }
	end

	def see_menu
		@price_list.each do
			|item, price| puts "#{item}: #{price}"
		end
	end
end