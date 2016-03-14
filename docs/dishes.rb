class Dishes

  attr_reader :name, :price, :quantity

  def initialize(name, price, quantity = 0)
    @name = name
    @price = price
    @quantity = quantity
  end

  def quantity(num = @quantity)
    @quantity = num
  end


end
