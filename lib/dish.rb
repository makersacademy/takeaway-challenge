class Dish
  attr_reader :name, :price

  def initialize(name, price)
    raise ArgumentError, 'dish name must not be empty' if name.empty?
    raise ArgumentError, 'dish price must be greater than 0' if price <= 0

    @name = name
    @price = price
  end
end
