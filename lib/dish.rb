class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def printout
    to_string
  end

private

  def to_string
    "#{@name} - #{@price}"
  end

end
