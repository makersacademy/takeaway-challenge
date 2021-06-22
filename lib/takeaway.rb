class Takeaway

  attr_reader :finished_order

  def initialize
    @finished_order = {}
  end

  def add_to_order(dish, quantity)
    @finished_order[dish] = quantity
  end
end