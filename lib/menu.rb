require_relative 'dish'

class Menu

attr_reader :menu

  def initialize
    dish1 = Dish.new("Rice", "£1.99")
    dish2 = Dish.new("Noodles", "£2.99")
    dish3 = Dish.new("Fried Wok", "£4.99")
    dish4 = Dish.new("Fried Rice", "£5.99")
    dish5 = Dish.new("Greens", "£2.99")
    menu_dishes = [dish1, dish2, dish3, dish4, dish5]
    @menu = menu_dishes
  end

end
