
class Dish

  attr_reader :description, :price

  def initialize(description, price)
    @description = description
    @price = price.to_i
  end

end
