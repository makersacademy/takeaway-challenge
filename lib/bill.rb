class Bill
  attr_reader :total

  def initialize
    @total = 0
  end

  def add(price)
    @total += price
  end
end
