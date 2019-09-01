class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

# I commented these methods after adding the attr_reader
  # def name
  #   @name
  # end
  #
  # def price
  #   @price
  # end

end
