require_relative 'menu'

class Customer
  
  attr_reader :cost

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
    @cost = 0
  end
  
  def show_menu
    menu.dishes
  end
  
  def check_order
    orders.dup
  end
  
  def order(dish, quantity = 1)
    an_order = menu.select_dish(dish, quantity)
    orders << an_order
    an_order.each { |a_dish| @cost += a_dish[dish].to_f }
  end
  
  
  private
  
  attr_reader :menu, :orders

end