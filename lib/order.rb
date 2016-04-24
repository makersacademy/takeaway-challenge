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
<<<<<<< HEAD

=======
>>>>>>> e0a906505dc8788842b91dffc12af2fdc6daa78b
	def total
		calculate
		display_total
	end
<<<<<<< HEAD

=======
>>>>>>> e0a906505dc8788842b91dffc12af2fdc6daa78b
	private

	attr_reader :menu
<<<<<<< HEAD

	def calculate
		@dishes.map {|dish, number| menu.price(dish) * number }.inject(:+)
	end

=======
	def calculate
		@dishes.map {|dish, number| menu.price(dish) * number }.inject(:+)
	end
>>>>>>> e0a906505dc8788842b91dffc12af2fdc6daa78b
	def display_total
		format("Your total is £%0.2f", calculate)
	end
end