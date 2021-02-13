class Dish

  def initialize(name, price, available = true)
    @name = name
    @price = price
    @available = available
  end

  def name
    @name.dup
  end

  def price
    @price.dup
  end

  def available
    @available.dup
  end

end
