require_relative './menu.rb'

class Order

  attr_reader :menu, :current_order

  def initialize(menu = Menu.new)
    @current_order = {}
    @menu = Menu::MENU
  end
  
  def place_order(dish, quantity)
    @current_order[:"dish"] = quantity
  end
  
end
