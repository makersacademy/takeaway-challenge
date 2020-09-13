class Menu
	DISHES = {
  "PadThai" => 7.99,
  "Curry" => 5.99,
  "Ramen" => 9.99,
  "Baked Icecream" => 6.99,
}
	attr_reader :dishes
	def initialize(dishes = DISHES)
		@dishes = dishes
	end 

	def print
		@dishes.map { |name, price|
			"#{name} £#{price}" }.join(", ")
	end

		def exist?(dish)
			!!dishes[dish]
		end 

		def price(dish)
			dishes[dish]
		end 
end