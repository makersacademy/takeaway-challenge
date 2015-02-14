class Menu

  attr_accessor :dish, :price

  def initialize(dish, price = 0)
    @dish = dish
    @price = price
  end

end