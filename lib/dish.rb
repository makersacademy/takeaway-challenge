class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def print_dish
    "#{name}: #{price}"
  end

end