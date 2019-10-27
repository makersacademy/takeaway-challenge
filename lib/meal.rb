require_relative 'menu'

class Meal

  attr_reader :meal

  def initialize
    @meal = []
  end

  def add(dish)
    @meal << dish
  end

end