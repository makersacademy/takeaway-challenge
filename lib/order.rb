require 'menu'
# require 'total'

class Order
  
  attr_reader :order, :menu

  def initialize
    @order = []
    @menu = Menu.new
  end

  def order_dish(dish)
    @order << @menu.select(dish) 
  end
end