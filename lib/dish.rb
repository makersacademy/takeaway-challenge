class Dish
  def initialize(name, price)
    @name = name
    @price = price
  end

  def view
    { @name => @price }
  end

  def price
    @price
  end
end
