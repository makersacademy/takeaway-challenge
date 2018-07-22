# dish class
class Dish

  attr_reader :name
  attr_reader :price

  def initialize(name, price)
    @name = name.to_sym
    @price = price
    puts price
  end

end
