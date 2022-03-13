class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
    @available = true
  end

  def available?
    @available
  end

  def set_unavailable
    @available = false
  end

  def set_available
    @available = true
  end
end
