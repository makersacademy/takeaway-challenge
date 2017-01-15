require_relative 'menu'

class Order

attr_reader :menu, :current_order, :total_cost, :order_complete

def initialize(menu)
  @menu = menu
  @current_order = {}
  @total_cost = 0
end

def add_item(dish, qty = 1)
  @current_order[dish].to_i == 0 ? @current_order[dish] = qty :
  @current_order[dish] = @current_order[dish].to_i + qty
  add_order_cost(dish.price, qty)
end

def finalise_order(confirm_total)
  raise wrong_amount_confirmed_message if confirm_total != @total_cost
  @order_complete = true
end

def complete?
  @order_complete
end

private

def wrong_amount_confirmed_message
  "Incorrent amount confirmed. Our total came up to: £#{@total_cost}."
end

def add_order_cost(price, qty)
  @total_cost += (price * qty).round(2)
end

end
