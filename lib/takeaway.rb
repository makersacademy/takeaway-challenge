require_relative 'menu'
require_relative 'order'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end 

  def show_menu
    @menu.view_menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity| @order.add_to_basket(dish, quantity)
    end 
     @order.total
  end

end 


