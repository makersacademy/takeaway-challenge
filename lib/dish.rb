class Dish

  def initialize(name: name, price: price)
    @name = name
    @price = price
  end

  def price
    @price * 1
  end

  def name
    @name.dup
  end

end
