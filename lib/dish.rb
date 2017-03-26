class Dish
  #stores the name and price of each dish

  attr_reader :name, :price

def initialize(name,price)
  @name = name
  @price = price.to_f 
end

end
