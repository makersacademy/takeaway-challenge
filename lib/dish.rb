class Dish

  attr_accessor :quantity

  def initialize(name, price)
    @name = name
    @price = price
    @quantity = nil
  end
end