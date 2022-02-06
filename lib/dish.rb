class Dish

  attr_reader :identifier, :name, :quantity_available, :price

  def initialize(identifier, name, quantity, price)
    @identifier = identifier
    @name = name
    @quantity_available = quantity
    @price = price
  end
  
  def view_price
    { @name => @price }
  end

  def view_quantity_available
    { @name => @quantity_available }
  end

  def available?
    @quantity_available > 0
  end

  def order(quantity)
    raise "Order cannot be fulfilled as not enough available" if @quantity_available < quantity
    @quantity_available -= quantity
  end


end
