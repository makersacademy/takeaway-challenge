require 'takeaway.rb'
require 'order.rb'
class Menu
  attr_reader :dishes
  DISHES_LIST = {
    "Chicken Rice" => 4.50,
    "Fried Chicken" => 5.50,
    "Fried Rice" => 2.50,
    "Side Salad" => 1.50,
    "Noodle Soup" => 3.50
  }

  def initialize
    @dishes = DISHES_LIST
  end
  def print
      @dishes.each { |dish, price| "#{dish}: £#{price}, " }
  end
end
