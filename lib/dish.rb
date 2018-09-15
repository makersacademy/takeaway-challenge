
class Dish
  attr_reader :name, :price
  attr_accessor :available
  def initialize(name, price, available: true)
    @name = name
    @price = price
    @available = available
  end
end
