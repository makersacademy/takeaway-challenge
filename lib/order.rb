class Order
  attr_accessor :dish, :quantity, :order, :line

  def initialize(dish = nil,quantity = 0 )
    @dish = dish
    @quantity = quantity
    @order = [{dish => quantity}]
  end

  def add_to_order(dish,quantity)
    @line = {dish => quantity}
    order << line
  end
end
