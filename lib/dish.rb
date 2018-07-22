class Dish

  attr_reader :name, :price

  def initialize(name = "meat", price = 10)
    @name = name
    @price = price
  end
end
