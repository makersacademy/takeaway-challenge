class Dish

  attr_reader :name, :price, :description

  def initialize(name, price)
    @name = name
    @price = price
  end

end