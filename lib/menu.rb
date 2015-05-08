class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish
    @dishes.push dish
  end

  def remove_dish dish
    @dishes.delete(dish)
  end

  def change_dish_name dish, new_name
    dish.name = new_name
  end

  def get_dish dish_name
    dishes.each do |dish|
      return dish if dish.name == dish_name
    end
    fail 'Dish not on menu'
  end
end
