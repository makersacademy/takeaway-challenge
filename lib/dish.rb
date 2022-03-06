class Dish

  attr_reader :price, :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def change_price(new_price)
    @price = new_price
  end

end