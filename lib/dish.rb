class Dish

  attr_reader :details

  def initialize(name, price)
    @details = {:name => name, :price => price}
  end

end