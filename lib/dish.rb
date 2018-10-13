require_relative 'menu'

class Dish
  attr_reader :dish, :price

  def initialize(dish, price)
    @dish = dish
    @price = price
  end

end
