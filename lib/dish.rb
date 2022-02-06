class Dish

  attr_reader :price

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity
    @price = price
  end
  
  def view_price
    { @name => @price }
  end

  def view_qty_available
    { @name => @quantity }
  end

end
