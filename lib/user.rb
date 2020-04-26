require "./lib/menu"
require "./lib/order"


class User
  attr_reader :order, :menu

  def initialize(menu  = Menu.new)
    @order = nil 
    @menu = menu
  end 

  def request_full_menu
    @menu.full_menu
  end 

  def new_order
    @order = Order.new
  end 
  
  def add_to_order(item, quantity)
    configured = item.downcase.gsub(/([ ])/, '_') 
    @order.add_item(configured, quantity)
  end 
    


end 