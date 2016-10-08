class Menu

	DISHES = [
		{:name => "Pizza", :price => 9.99},
		{:name => "Kebab", :price => 4.99},
		{:name => "Chicken Wings", :price => 3.49},
		{:name => "Chips", :price => 2.99},
		{:name => "Ice-cream", :price => 4.99}]

	attr_reader :dishes, :dish_class

	def initialize(dish_class = Dish)
		@dish_class = dish_class
		@dishes = create_dishes
	end

	private

	def create_dishes
		dishes = []
		DISHES.each {|dish| dishes << @dish_class.new(dish[:name],dish[:price])}
		dishes
	end

end
