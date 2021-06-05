require_relative 'order'

class Order 
  attr_reader :meals
  
  def initialize
    @meals = []
  end

  def add(dish)
    @meals << dish
  end
end