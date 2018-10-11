class Dish
  attr_reader :name, :price
  def initialize(name:, price:)
    @price = price
    @name = name
  end

  def to_s
    name
  end
end
