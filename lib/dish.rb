class Dish

  attr_reader :price
  attr_accessor :type, :dish

  DISH_PRICE = 1

  def initialize
    @type = type
    @price = DISH_PRICE
  end

end
