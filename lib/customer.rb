require_relative 'menu'

class Customer

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
  end
  
  def list_dishes
    menu.dishes
  end
  
  def check_order
    orders.dup
  end
  
  def order(dish, quantity = 1)
    orders << menu.select_dish(dish, quantity)
  end
  
  private
  
  attr_reader :menu, :orders

end