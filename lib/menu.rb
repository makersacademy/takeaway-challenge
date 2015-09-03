require_relative 'dish'
class Menu
  attr_reader :display
  def initialize
    @display
  end
  
  def display
    @display = {
      "hamburger" => Dish.burger.price,
      "cheeseburger" => Dish.cheeseburger.price,
      "double cheeseburger" => Dish.doublecheese.price,
      "hotdog" => Dish.hotdog.price,
      "fries" => Dish.fries.price
    }
  end
end
