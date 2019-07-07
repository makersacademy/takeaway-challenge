class Order

attr_reader :order_details

  def initialize(dish, quantity)
    @order_details = []
    @dish = dish
    @quantity = quantity
  end

  def order
    @order_details << { dish: @dish, quantity: @quantity}
  end
end
