class Dish

  attr_reader :price, :name

  def initialize(name: name, price: price)
    @name = name
    @price = price
  end

end
