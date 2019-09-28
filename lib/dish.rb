class Dish
  attr_accessor :name, :price, :quantity

  def initialize(args)
    @name     = args[:name]
    @price    = args[:price]
  end
  
end