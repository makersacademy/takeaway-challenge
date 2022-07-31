class Dish

  def initialize(name, price)
    @name = name
    @price = price
  end

  def read_name
    @name.dup
  end

  def read_price
    @price.dup
  end

  def read_quantity
    @quantity.dup
  end

  def amount(quantity)
    @quantity = quantity
  end

  def dish_total
    @quantity * @price
  end

end
