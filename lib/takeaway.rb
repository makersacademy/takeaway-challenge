require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  attr_reader :menu, :order

  def view_menu
    @menu.view
  end

  def add_item(item, quantity = 1)
    raise("Item not on menu") unless @menu.on_menu?(item)

    @order.add(item, quantity, @menu.price(item))
  end

  def view_order
    @order.view
  end

  def order_total
    "Your order total is £#{@order.total}"
  end

end
