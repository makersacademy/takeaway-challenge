

class Place_order
  attr_reader :current_order
  def initialize
    @current_order = Hash.new(0)
  end

  def add(dish, quantity)
    @current_order[dish] += quantity
  end
end
