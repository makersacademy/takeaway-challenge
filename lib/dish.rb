require './lib/menu.rb'
require './lib/order.rb'

class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

end
