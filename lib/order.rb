class Order

  START_TOTAL = 0
  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
    @total = START_TOTAL
  end

  def add(item, price, quantity)
    basket[item] += quantity
    @total += (price * quantity)
  end

end
