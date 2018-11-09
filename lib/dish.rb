class Dish
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{@name}".ljust(40) + "£#{@price}".ljust(70)
  end

end
