class Meal
  attr_reader :number, :name, :price

  def initialize(number, name, price)
    @number = number
    @name = name
    @price = price
  end

end
