class Dish

attr_reader :name, :price, :available

def initialize(name, price)
  @name = name
  @price = price
  @available = true
end

end
