
class Takeaway
  require_relative './menu.rb'
  require_relative './order.rb'

  attr_reader :menu, :order
  
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end
  
  def read_menu
    @menu.show_menu
  end  

  def order_item(name)
      @order.basket << menu.find_item(name)
  end

  def show_order
    @order.show_basket
  end

end
