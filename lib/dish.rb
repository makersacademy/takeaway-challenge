class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def info
    info = [@name, @price]
    return info
  end
end