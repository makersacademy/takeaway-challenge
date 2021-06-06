class Menu
  
  attr_accessor :dish, :price

  def initialize(dish,price = 1)
    @dish = dish
    @price = price
  end
end