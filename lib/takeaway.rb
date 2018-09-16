require_relative 'dish'
require_relative 'printer'
require_relative 'menu'
require_relative 'order'
require_relative 'sender'

class Takeaway
  attr_reader :menu, :order, :sender

  def initialize(menu = Menu.new, order = Order.new, sender = Sender.new)
    @menu = menu
    @order = order
    @sender = sender
  end

  def view_menu
    print menu.display
  end

  def add(name, qty = 1)
    order.add(name, qty)
  end

  def view_order
    print order.display
  end

  def checkout
    sender.send
  end
end
