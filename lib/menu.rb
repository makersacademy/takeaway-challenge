class Menu

  attr_reader :dish, :price, :available

  def initialize(dish, price, available)
    @dish = dish
    @price = price
    @available
  end

  def available?
    @available = true
  end
end
