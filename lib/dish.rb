class Dish
  attr_reader :name, :price
  attr_accessor :quantity
  def initialize(name:, price:)
    @name = name
    @price = price
    @quantity = 1
  end

end