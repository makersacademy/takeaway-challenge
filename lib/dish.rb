class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price.to_f
  end
end