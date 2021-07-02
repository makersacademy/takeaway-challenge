require 'menu'

class Order
  attr_reader :menu
  
  def initialize(menu = Menu.new)
    @menu = menu
    @order =[]
  end
  
  def order_to_fullfill
    @order << @menu.selection
  end

end

order = Order.new
order.order_to_fullfill