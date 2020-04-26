require "./lib/menu"
require "./lib/order"


class User
  attr_reader :order

  def initialize 
    @order = nil 
  end 

  def request_full_menu(menu)
    menu = Menu.new 
    menu.full_menu 
  end 

  def new_order
    @order = Order.new
  end 
  
  def add_to_order(item, quantity)
    @order.add_item(item, quantity)
  end 
    


end 