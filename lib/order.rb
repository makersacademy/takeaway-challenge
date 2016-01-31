require_relative 'takeaway'
class Order

  attr_reader :total

  def initialize
    @total = 0
  end

  def add(price)
    @total += price
  end

  def reset
    @total = 0
  end

end
