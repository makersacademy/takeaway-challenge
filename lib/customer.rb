require_relative 'dishes'
require_relative 'cart'

class Customer

  attr_reader :dishes

  def initialize(dishes = Dishes.new)
    @dishes = dishes
  end

  def view_dishes
    dishes.list
  end

end
