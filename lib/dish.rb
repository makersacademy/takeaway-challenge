class Dish
  def initialize(name, price, type)
    @name = name
    @price = price
    @type = type
  end

  def name
    @name.dup
  end

  def price
    @price.dup
  end

  def type
    @type.dup
  end
end
