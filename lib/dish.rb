class Dish
  attr_reader :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def to_s
    "#{@name} - £#{format("%<num>0.2f", num: @price)}"
  end
end
