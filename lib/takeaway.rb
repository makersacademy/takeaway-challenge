class Takeaway

  attr_reader :menu, :current_order

  def initialize
    @menu = Dishes.new
    @current_order = {}
  end

  def print_menu
    @menu.list
  end

  def select(dish)
    @current_order[dish] = @menu.list[dish]
  end

  def order_total
    @current_order.values.sum
  end

end
