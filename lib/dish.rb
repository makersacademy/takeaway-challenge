class Dish

  attr_reader :details, :name, :price

  def initialize(name, price)
    @details = {name: name, price: price}
  end

end
