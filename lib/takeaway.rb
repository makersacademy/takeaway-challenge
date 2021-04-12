require_relative 'menu'
require_relative 'order'

class Takeaway

  

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def print_basket
    order.basket
  end

  def add(dish,amount)
    order.place_order(dish,amount)
  end

  private
  
  attr_reader :menu, :order
 
  #def add_dihes(dishes)
  #dishes.each do |dish, quantity|
   #   order.place_order(dish, amount)
  #  end
  #end  

end





