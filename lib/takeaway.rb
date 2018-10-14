require 'menu'
require 'order'
require 'text'

class Takeaway

  attr_reader :menu, :order, :text

  def initialize(menu = Menu.new, order = Order.new, text = Text.new)
    @menu = menu
    @order = order
    @text = text
  end

  def print_menu
    @menu.list_menu
  end

  def add_to_order(item, quantity = 1)
    raise "Item not on menu!" if available(item) == false
    @order.add_to_basket(item, quantity)
    @order.add_to_total(get_price(item), quantity)
  end

  def order_summary
    @order.order_summary
  end

  def basket
    @order.basket
  end

  def total
    @order.total
  end

  def place_order(sum)
    raise "Incorrect sum given" if sum != @order.total
    @text.send_sms
  end

  def clear_order
    @order.clear_basket
    @order.clear_total
  end

  private

  def get_price(item)
    @menu.get_price(item)
  end

  def available(item)
    @menu.items.has_key?(item)
  end

end
