class Order
  attr_reader :dish, :quantity, :total

  def initialize(dish, quantity = 1, total)
    @dish = dish
    @quantity = quantity
    @total = total
  end
end
