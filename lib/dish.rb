class Dish

  attr_reader :id, :price

  def initialize(id, price)
    @id = id.capitalize
    @price = price
  end

end
