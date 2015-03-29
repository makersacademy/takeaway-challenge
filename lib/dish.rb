class Dish
  attr_reader :name, :price, :quantity
  def initialize name, price, quantity
    @name = name
    @price = price
    @quantity = quantity
  end

  def available?
    @quantity > 0
  end
end