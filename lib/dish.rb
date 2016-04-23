class Dish
  def initialize name, price
    @name = name
    @price = price
  end

  attr_writer :name
  attr_accessor :price

  def name
    @name.clone
  end

end
