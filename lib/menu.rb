require_relative 'dish'

class Menu

  attr_reader :items

  def initialize
    @items = [Dish.new("Burger", 9), Dish.new("Curry", 8), Dish.new("Soup", 6)]
  end

  def add_item(name, price)
    dish = Dish.new(name, price)
    @items << dish
  end

end
