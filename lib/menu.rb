require_relative './dish.rb'
require_relative './order.rb'

class Menu

  DEFAULT_MENU = {biriyani: 5.00, uk_curry: 6.00, cheeseburger: 4.00, pizza: 5.00, side_of_salmonella: 1.95}

  attr_reader :dishes

  def initialize
    @dishes = DEFAULT_MENU
  end

  def add_dish name, price
    dishes[name] = price
  end
end