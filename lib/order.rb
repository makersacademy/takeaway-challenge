class Order
  attr_reader :dish, :quantity

  def initialize(dish, quantity = 1)
    @dish = dish
    @quantity = quantity
  end
end
