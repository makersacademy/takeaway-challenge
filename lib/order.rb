class Order

  attr_reader :menu_list, :order_log, :sum
  def initialize
    @order_log = []
    @sum = []
    menu
  end

  def menu
    @menu_list = {icecream: 5,
                  dohnuts: 2,
                  potatoes: 1}
  end

  def add_order(food, quantity)
    # price = @menu_list[food.to_sym]
    @sum << (@menu_list[food.to_sym]) * quantity
    @order_log << [food, quantity]
  end

  def total
    @total = @sum.reduce(:+)
  end
end
