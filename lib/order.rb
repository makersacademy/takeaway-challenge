require_relative 'menu'

class Order
  attr_reader :menu

  def initialize (menu = Menu::DISHES)
    @menu = menu
  end

  def add_to_order(dish, quantity)

  end

end
