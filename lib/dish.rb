class Dish

  def initialize(name, quantity, price)
    @name = name
    @price = price
    @quantity = quantity
  end

  def add
    { dish: @name, price: @price, quantity: @quantity }
  end
end
