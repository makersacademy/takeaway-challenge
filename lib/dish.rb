class Dish
  attr_reader :name, :price, :available

  def initialize(name, price)
    @name = name
    @price = price
    @available = true
  end

  def not_available
    @available = false
  end

end
