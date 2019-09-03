require 'dish'

class Menu

  ERROR_INVALID_PRICE = "Invalid Price!"
  ERROR_IS_NOT_A_DISH = "Error! you need to add a real dish!"

  DEFAULT_DISHES =  [
    Dish.new("Fried chicken", 4),
    Dish.new("Tacos", 3),
    Dish.new("Sushi", 1),
    Dish.new("Salad", 2),
  ]

  attr_reader :dishes

  def initialize(dishes = DEFAULT_DISHES)
    @dishes = dishes
  end

  def view_menu
    puts " --- MENU ---"
    @dishes.each.with_index { |item, index|
      puts "[#{index + 1}] #{item.name}: £#{item.price}"
    }
    puts " ------------"
  end

  def get_dish_by_id(id)
    @dishes[id - 1]
  end

  def add_dish(dish)
    fail ERROR_IS_NOT_A_DISH unless dish.is_a?(Dish)
    fail ERROR_INVALID_PRICE unless dish.price > 0

    @dishes << dish
  end


end
