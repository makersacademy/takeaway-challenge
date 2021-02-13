class Dish

attr_reader :name, :price

#names are to be passed as symbols
  def initialize(name, price)
    @name = name
    @price = price
  end

end
