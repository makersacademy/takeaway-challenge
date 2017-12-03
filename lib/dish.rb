class Dish
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{name}, £#{format('%.2f',price)}"
  end

end
