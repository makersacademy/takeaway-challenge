require_relative 'dish_printer'

class Dish

  include DishPrinter
  attr_reader :price, :id

  @@id = 0

  def initialize name, price
    @name = name
    @price = price
    @id = @@id += 1
  end
  
  def describe
    pretty_print name: @name, id: @id, price: @price
  end
end
