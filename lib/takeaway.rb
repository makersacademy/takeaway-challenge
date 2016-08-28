require_relative 'menu'
require_relative 'order'
require_relative 'send_text'

include Menu

class Takeaway

  DEF_QUANTITY = 1
  attr_reader :order

  def initialize(order = Order.new, text = Text.new)
    @text = text
    @order = order
  end

  def read_menu
    Menu::read
  end

  def add(item, quantity = DEF_QUANTITY)
    order.add(item, ITEMS[item], quantity)
    "Added #{quantity}x #{item} to your order."
  end

  def view_order
    "Your basket contains: #{order.basket}"
  end

  def check_total
    "The correct total is £#{order.total}0."
  end

  def confirm_order(total)
    total == order.total ? @text.send_text : check_total
    'Thank you, you will receive your delivery time by text'
  end

end
