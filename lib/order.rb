require 'order_item'
class Order
  attr_reader :order_item
  def initialize
    @order_list = []
  end

  def add_dish(dish)
    item = OrderItem.new(dish)
    @order_list << item
    item
  end
end
