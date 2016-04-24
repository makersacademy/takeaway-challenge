require_relative 'menu'
require_relative 'order'

class Restaurant

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end
  
  def show_menu
    menu.dishes
  end
  
  def place_order(dish, quantity = 1)
    an_order = menu.select_dish(dish)
    order.take_order(an_order, quantity)
  end
  
  def check_order
    order.check_order
  end
  
  def check_total
    order.total_cost
  end
  
  def confirm_order
    order.text_confirmation
    @order = Order.new
  end
  
  
  private
  
  attr_reader :menu, :order
  

end