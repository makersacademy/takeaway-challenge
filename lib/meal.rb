require_relative 'dish.rb'

class Meal

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def total
    total = 0.00
    @dishes.each do |i|
      total += i.total
    end
    total
  end

end
