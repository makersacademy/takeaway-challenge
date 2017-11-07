require './lib/dish.rb'
require './lib/menu.rb'
require './lib/order.rb'
require './lib/takeaway.rb'

@menu = Menu.new
@order = Order.new
@takeaway = Takeaway.new

def menu
  @menu
end

def order
  @order
end

def takeaway
  @takeaway
end
