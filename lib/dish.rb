class Dish

  attr_reader :dish, :price, :quantity, :sum

  def initialize(dish,price,quantity)
    @dish = dish
    @price = price
    @quantity = quantity
  end
end
