# contains a list of all available dishes for selection

require './lib/dish.rb'
require './lib/cart.rb'

class Menu

  def initialize
    @list = []
  end

  attr_reader :list

  def add(dish)
    list.push(dish)
  end

end
