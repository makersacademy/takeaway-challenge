class Order

  attr_reader :order_list

  def initialize
    @order_list = []
  end

  def add_to_order(dish, quantity)
    @dish = dish
    @quantity = quantity
    order_list << { dish: @dish, quantity: @quantity }
  end
end
