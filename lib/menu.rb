require_relative 'dish'

class TakeawayMenu

attr_reader :menu
attr_accessor :select_dishes

  def initialize
    dish1 = Dish.new("Rice", 1.99)
    dish2 = Dish.new("Noodles", 2.99)
    dish3 = Dish.new("Fried Wok", 4.99)
    dish4 = Dish.new("Fried Rice", 5.99)
    dish5 = Dish.new("Greens", 2.99)

    @menu = [dish1, dish2, dish3, dish4, dish5]
  end

  def select_dish(dish_number)
    @menu[dish_number]
  end

  def select_dishes(dish_number_array)
    dishes_array = []
    for dish_number in dish_number_array
      dish = menu[dish_number]
      dishes_array << dish
    end
    dishes_array
  end

end
