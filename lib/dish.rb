class Dish

  attr_reader :name, :price

def initialize(args)
  @name = args[:name]
  @price = args[:price]

end

end
