class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
    #add to CSV file
  end

end
