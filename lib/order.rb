class Order
	attr_reader :dishes
	def initialize(menu)
		@dishes = nil
		@menu = menu
	end
	
	def log(number_dishes)
		number_dishes.each_key{|dish| fail "#{dish.capitalize} is not in the menu" unless menu.dish?(dish) }
		@dishes = number_dishes
	end

	def total
		private_calculate
		private_display_total
	end

	private

	attr_reader :menu

	def private_calculate
		@dishes.map {|dish, number| menu.price(dish) * number }.inject(:+)
	end

	def private_display_total
		format("Your total is £%0.2f", private_calculate)
	end
end