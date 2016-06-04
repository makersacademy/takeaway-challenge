class JapaneseMenu

	MENU = {'edamame' => 3,
					'salmon maki' => 8,
					'tuna maki' => 8,
					'soft shell crab maki' => 10,
					'avocado maki' => 4,
					'miso soup' => 2}

	def initialize(menu = MENU)
		@menu = menu
	end

	def view
		@menu.each do |item, price|
			p "#{item} £#{price}"
		end
	end

	def price (item)
		@menu[item]
	end

end

