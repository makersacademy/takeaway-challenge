class Dish

  attr_reader :price, :name

  def initialize(name, price)
    @price = price
    @name = name
  end

end