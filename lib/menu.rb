class Menu
	attr_reader :dishes
	
	def initialize
		@dishes = [
			{:dish_number => 1, :dish => 'Chicken', :price => 10},
			{:dish_number => 2, :dish => 'Beef', :price => 10},
			{:dish_number => 3, :dish => 'Lamb', :price => 10},
			{:dish_number => 4, :dish => 'Prawns', :price => 10},
			{:dish_number => 5, :dish => 'Cod', :price => 7},
			{:dish_number => 6, :dish => 'Haddock', :price => 7},
			{:dish_number => 7, :dish => 'Carrots', :price => 5},
			{:dish_number => 8, :dish => 'Potatoes', :price => 5},
			{:dish_number => 9, :dish => 'Rice', :price => 3},
			{:dish_number => 10, :dish => 'Noodles', :price => 3}
		]
	end

	def list(items)
		items.each do |item|
			"#{item[:dish_number]} ----- #{item[:dish]} ----- £#{item[:price]}"
		end
	end
end