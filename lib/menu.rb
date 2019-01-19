require_relative 'dish'

class Menu

    attr_reader :menu_list

  def initialize
    @menu_list = {}
  end

  def to_string
    @menu_list.each { |dish, price|
      return "#{dish} at £#{price}\n"
    }
  end

  def add(dish_name, price, dish = Dish)
    dish.new(dish_name, price)
    @menu_list[dish_name] = price
  end
  # def menu
  #   {
  #     "Dough Balls" => 4.49,
  #     "Cheeseburger Dough Balls" => 5.79,
  #     "Garlic Pizza Bread" => 3.99,
  #     "Chicken Wings" => 5.99,
  #     "Mozzarella Sticks" => 4.99
  #   }
  # end
end
