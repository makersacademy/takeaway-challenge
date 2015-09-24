class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_info
    @name + ' £ ' + price
  end

end
