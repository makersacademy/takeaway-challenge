class Menu

  attr_reader :dishes

  def initialize
    @dishes = [Dish.new("Lasagna", 10), Dish.new("Burger", 8), Dish.new("Salad", 6)]
  end

	def add_item(name, price)
	   dish = Dish.new(name, price)
	   dishes << dish
	end

end
