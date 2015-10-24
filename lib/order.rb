class Order

  attr_reader :menu, :order_log, :sum
  def initialize
    @order_log = []
    @sum = []
    @menu = {icecream: 5,
             dohnuts: 2,
             potatoes: 1}
  end

  def add_order(food, quantity)
    @sum << (@menu[food.to_sym]) * quantity
    @order_log << [food, quantity]
  end

  def total
    @total = @sum.reduce(:+)
  end
end
