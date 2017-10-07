class Takeaway

  attr_reader :menu, :current_order

  def initialize
    @menu = Dishes.new
    @current_order = {}
  end

  def print_menu
    @menu.list
  end

  def select(dish, quantity = 1)
    item_subtotal = @menu.list[dish] * quantity
    @current_order[dish] = item_subtotal
  end

  def order_total
    @current_order.values.sum
  end

  def place_order
    "Thanks! Your order, total of #{order_total} is being processed"
  end

end
