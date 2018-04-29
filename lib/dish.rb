class Dish
  attr_reader :name, :price
  attr_accessor :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price.to_f
    @quantity = quantity.to_i
  end
end
