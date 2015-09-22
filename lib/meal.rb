require 'dish'

class Meal

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def total
    total = 0.00
    @dishes.each do |dish|
      total += dish.total
    end
    total
  end

end
