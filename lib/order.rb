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
	private
	attr_reader :menu
end