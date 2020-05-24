require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :current_menu, :order

  def initialize
    @current_menu = Menu.new
    @order = Order.new
  end

  def display_menu
    @current_menu.display_menu 
  end

  def order(dish, quantity)
   @order.to_order(dish, quantity)
    "#{quantity} #{dish}(s) added to order"
  end
    
end
