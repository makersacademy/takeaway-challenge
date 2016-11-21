class Dish
DEFAULT_PRICE = 10
DEFAULT_NAME = "House Special"

attr_reader :price, :name

  def initialize(name = DEFAULT_NAME, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end


end
