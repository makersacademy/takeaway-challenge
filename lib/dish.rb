class Dish

  def initialize(name, price)
    @name = name
    @price = price
  end

  def present
    { name => price }
  end

  private
  attr_reader :name, :price

end
