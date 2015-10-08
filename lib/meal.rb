require_relative 'dish'

# Meal is responsible for containing an array of Dishes and provides a total
# cost.
class Meal

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
    self
  end

  def total
    total = 0.00
    @dishes.each do |dish|
      total += dish.total
    end
    total
  end

end
