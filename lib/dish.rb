class Dish

  attr_reader :identifier, :name, :quantity_available, :price

  def initialize(identifier, name, quantity, price)
    @identifier = identifier
    @name = name
    @quantity_available = quantity
    @price = price.to_f
  end
  
  def view_price
    { @name => @price }
  end

  def view_quantity_available
    { @name => @quantity_available }
  end

  def available?
    @quantity_available.positive?
  end

  def check_availability(quantity)
    raise "Order cannot be fulfilled as not enough available" if @quantity_available < quantity
    @quantity_available -= quantity
  end

  def details
    "#{@identifier}: #{@name} - £#{'%.2f' % @price}"
  end

end
