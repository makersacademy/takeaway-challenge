require_relative '../lib/menu'

class Customer

  attr_accessor :order_total

  def initialize
    @order_total = 0
  end

  def select_dish menu , dish_number
    @order_total += menu.display_menu[dish_number - 1][1]
    menu.display_menu[dish_number - 1]
  end

  def text
  end

end