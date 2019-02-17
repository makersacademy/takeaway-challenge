class Dish
  attr_reader :name, :price
  
  def initialize(price:, name:)
    @price = price
    @name = name
  end
end
