require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def show_menu
    menu.show
  end

  def add_to_order(dish_name, quantity = 1)
    order.add_item(dish_name, quantity)
  end
  
  def show_total
    order.show_total
  end

  def show_order
    order.show
  end

  def place_order(total_received)
    error_message = "Total received doesn't match the order total"
    raise error_message if total_received != order_total
    @messenger.send_message
    "Sent!"
  end

  def order_total
    order.calc_total
  end
end
