require_relative 'menu'
require_relative 'dish'
class Order
  attr_reader :order

  def initialize(order_line_class)
    @menu = Menu.new(Dish)
    @menu = @menu.load
    @order_line = order_line_class
    @order = []
  end

  def create(selection, quantity)
    raise "Item not in menu" if @menu[selection - 1].nil?
    
    name = dish_list[selection - 1].name
    price = dish_list[selection - 1].price
    @order << @order_line.new(quantity, name, price)
  end

end
