#understands customer expectations
require_relative 'menu'
require_relative 'order'

class Restaraunt
  include Menu

  def initialize
    p "Welcome! 'check_menu' or 'select_dishes' to start!"
  end

  def check_menu
    Menu::MENU
  end

  def select_dishes(array_of_dishes_and_quantities, expected_price)
    order = array_of_dishes_and_quantities
    Order.new(order, expected_price).checkout
  end

end
