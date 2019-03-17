class Dish

  attr_reader :name, :price

  def initialize(name, price, availability = true)
    @name = name 
    @price = price
    @availability = availability
  end

  def details
    "#{@name} - #{@price}"
  end

end