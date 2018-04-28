class Dish

  attr_reader :name, :description, :price

  def initialize(name: nil, description: nil, price: nil)
    @name = name
    @description = description
    @price = price
  end

end
