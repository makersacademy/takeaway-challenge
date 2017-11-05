require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'

@menu = Menu.new
@order = Order.new

def menu
  @menu
end

def order
  @order
end
