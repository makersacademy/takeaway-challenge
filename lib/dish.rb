class Dish
  include Formatter
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def print_price
    format_price(@price)
  end
end
