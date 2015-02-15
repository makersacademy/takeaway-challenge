class Cart

  attr_accessor :dish, :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
  end

  def order_total
    dish.price * quantity
  end

end