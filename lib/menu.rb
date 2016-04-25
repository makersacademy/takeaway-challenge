require_relative 'dish'

class Menu

	attr_reader :dishes

	def initialize(dish_class = Dish)
		@dishes = {"2" => Dish.new("Sushi", "%.2f" % 8.00)}
		@dish_class = dish_class
	end

	def print
		fail "No menu available, try again later" if @dishes.empty?
		puts "No.	Dish Name	Price"
		@dishes.each do |k,v|
		puts "#{k}	#{v.name}		#{v.print_price}"
		end
	end

	def add_dish(number, dish_name, dish_price)
		@dishes["#{number}"] = @dish_class.new(dish_name, "%.2f" % dish_price)
	end

end