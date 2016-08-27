# understands how to place and confirm orders

require_relative 'dishes'

class Restaurant

  attr_reader :dishes

  def initialize(dishes = Dishes)
    @dishes = dishes.new
  end

  def available_dishes
    dishes.dishes
  end

end
