class OrderLine

  attr_reader :dish, :quantity, :cost

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
    @cost = dish.price * quantity
  end

end
