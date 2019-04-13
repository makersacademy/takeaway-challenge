class Dish

#attribute reader
  def name
    @name
  end
#attribute reader
  def price
    @price
  end

  def initialize(name, price)
    @name = name
    @price = price
  end

end
