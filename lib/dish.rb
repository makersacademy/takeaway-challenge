class Dish

  attr_reader :name, :price, :available

  def initialize(name, price, available)
    @name = name
    @price = price
    @available = true
  end
end
