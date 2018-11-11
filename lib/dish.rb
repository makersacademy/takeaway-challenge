class Dish
  attr_accessor :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end

  def dish_to_h
    { name: @name, price: @price }
  end
end
