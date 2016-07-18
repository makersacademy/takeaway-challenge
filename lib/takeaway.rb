require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway

  def initialize
    @menu = Menu.new
    @order = Order.new
    @message = Messenger.new
  end

  def menu
    @menu.show_menu
  end

  def order
    @order.add_to_basket(name, quantity)
    @order.total
  end

  def checkout
    charge
    message.send_message
  end
end
