require "./lib/order"

class TakeAway
  def initialize(order=Order.new,menu=Menu.new)
    @order = order
    @menu = menu
  end

  def print_menu
    @menu.print
  end

  def order(item,amount=1)
    fail 'Item is not in menu!' unless @menu.has_item?(item)
    @order.order(item,amount)
  end

  def basket
    @order.basket
  end
end

t = TakeAway.new
t.print_menu
t.order("Vanilla Milkshake",2)
t.basket
