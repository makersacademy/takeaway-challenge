require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  attr_reader :menu, :order

  def view_menu
    @menu.view
  end

  def add_item(item,quantity=1)
    raise ("Item not on menu") unless @menu.on_menu(item)
    @order.add(item,quantity,@menu.price(item))
  end

end
