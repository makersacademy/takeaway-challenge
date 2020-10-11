require 'order'
require 'menu'
require 'confirmation_text'

class Takeaway
  def initialize(order = Order.new, menu = Menu.new, sms = ConfirmationText.new)
    @order = order
    @menu = menu
  end

  def read_menu
    @menu.display_menu
  end

  def add_to_basket(item, quantity)
    @order.add(item, quantity)
  end

  def remove_from_basket(item)
    @order.remove(item)
  end

  def total_price
    @order.total
  end
  
  def confirmation_text
    @sms.send_message
  end
end