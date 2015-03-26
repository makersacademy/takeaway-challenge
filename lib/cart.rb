class Cart

  attr_accessor :dish, :quantity, :price

  def initialize(dish, quantity, price)
    @dish = dish
    @quantity = quantity
    @price = price
  end

  def order_total
    dish.price * quantity
  end

end