class Option

  attr_reader :food, :price
  

  def initialize(food: food = "tofu", price: price = 5)
    @food = food
    @price = price 
  end

end
