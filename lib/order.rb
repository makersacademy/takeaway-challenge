class Order
  attr_reader :dish
  attr_accessor :quantity, :price

  def initialize(dish, quantity, price)
    @dish = dish
    @quantity = quantity
    @price = price
  end

  def total_price
    @price * @quantity
  end
end
