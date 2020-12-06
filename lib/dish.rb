class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display
    formatted_price = format('%<price>.2f', price: @price)
    "#{name}: £#{formatted_price}"
  end

end
