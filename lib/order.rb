class Order
  attr_reader :order_list

  def initialize
    @order_list = []
  end
  
  def add(dish, quantity = 1)
    item = {}
    item[dish] = quantity
    @order_list << item
  end

end