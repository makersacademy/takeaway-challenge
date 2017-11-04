class Dish
  attr_reader :name, :price, :dish_info
  def initialize(name, price)
    @name = name
    @price = price
    @dish_info = {name => price}
  end
end
