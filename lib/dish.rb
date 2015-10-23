class Dish
  attr_reader :description, :price, :quantity
  def initialize(description: description, price: price)
    @description = description
    @price = price
    @quantity = 0
  end

  def update_quantity(quantity)
    raise "Quantity is negative" if quantity < 0
    @quantity = quantity
  end
end
