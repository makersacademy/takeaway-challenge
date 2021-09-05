class Restaurant

	attr_reader :dishes

	def initialize
		 @dishes = {}
	end

	def add(name, price)
		dish = Dish.new(name,price)
		dishes.store(dish.name,dish.price)
	end

	def menu
		puts "Our Menu"
		puts "======================"
		@dishes.each{
			|key, value|
			puts "#{key}......#{value}"
		}
	end
end