class Order
  attr_reader :basket_summary
  
  def initialize
    @basket_summary = Hash.new(0)
    @total = 0
  end

  def add(dish, quantity = 1)
    @basket_summary[dish] += quantity
  end

end