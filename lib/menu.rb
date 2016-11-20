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
    dish6 = Dish.new("Empanadas", 9.99)

    @menu = [dish1, dish2, dish3, dish4, dish5]
  end

  def select_dish(dish_number)
    @menu[dish_number]
  end

  def select_dishes(dish_number_array)
    dishes_array = []
    for dish_number in dish_number_array
      dish = select_dish(dish_number)
      dishes_array << dish
    end
    dishes_array
  end

  def calculate_price(dishes_array)
    total_price = []
    for dish in dishes_array
      price = dish.price
      total_price << price
    end
      total_price.inject(0, &:+)
  end

  def place_order(dish_numbers_to_order)
    dishes_array  = select_dishes(dish_numbers_to_order)
    total_price = calculate_price(dishes_array)
    "Your order was placed and the total amount is £#{total_price}"
  end

end
