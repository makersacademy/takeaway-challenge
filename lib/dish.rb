# this class will hold instances of individual dishes incl. their name and price
class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def menu_readable
    "#{name}, £#{price}"
  end

end
