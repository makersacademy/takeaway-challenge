class OrderCost
  def initialize
    @total = 0
  end

  attr_reader :total

  def add(number)
    @total += number
  end

  def reset
    @total = 0
  end

end