class Dish


attr_accessor :name, :price

  def initialize name, price=1 #this is the default price
    @name = name
    @price = price
  end

end