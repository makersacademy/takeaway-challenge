class OrderItem
  attr_accessor :dish, :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
  end
end