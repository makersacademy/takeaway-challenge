class Dish
  attr_reader :description, :price
  def initialize(description: description, price: price)
    @description = description
    @price = price
  end

  def update_quantity(quantity)
    raise "Quantity is negative" if quantity < 0
    @quantity = quantity
  end
end
