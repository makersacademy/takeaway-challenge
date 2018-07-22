class Dish

  attr_reader :details
  
  def initialize(name = "meat", price = 10)
    @details = {name: name, price: price}
  end
end
