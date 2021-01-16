require_relative 'menu'

class Takeaway

  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = Array.new
  end

  def display_menu
    @menu.show_menu
  end

  def select_dish(dish)
    fail "Selection unavailable" if on_menu?(dish) == false

    order.push(dish)
  end

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def place_order
  end 

end
