
class Order
  attr_reader :meals

  def initialize
    @meals = Hash.new(0)
  end

  def add(meal, number)
    meals[meal] += number
  end

end
