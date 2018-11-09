class Dish

  attr_reader :name, :amount_left, :available

  def initialize(name, price)
    @name = name
    @price = price
    @available = true
  end

  def available?
    return @available
  end

  def set_availability(condition)
    @available = condition
  end

  def get_formatted_price
    "£#{'%.2f' % (@price/100.0)}"
  end
  def set_price(pence)
    @price = pence
  end

private



end
