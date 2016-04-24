require './lib/menu.rb'
require './lib/order.rb'
require './lib/messenger.rb'

class Takeaway
  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def read_menu
    @menu.read
  end

  def order(dish, qty = 1)
    @order.select(dish, qty)
  end

  def basket
    @order.basket
  end

  def summary
    @order.summary
  end

  def qty_tracker
    @order.qty_tracker
  end

  def confirm
    @messenger.confirm
  end

end
