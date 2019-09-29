class Order
  attr_reader :order

  def initialize(dish, quantity, price)
    @dish = dish
    @quantity = quantity
    @price = price
  end

  def order_price
    @price * @quantity
  end
end
