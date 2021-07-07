class Dish
  attr_reader :number, :price, :name

  def initialize(number, price, name)
    @number = number 
    @price = price
    @name = name
  end
  
end
