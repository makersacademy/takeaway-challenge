class Dish
  attr_reader :name, :price, :hash

  def initialize(name = "Hash brown", price = 0.99)
    @name = name
    @price = price
    @hash = {}
  end

  def itemise
    @hash[@name] = @price.round(2)
    @hash
  end
end
