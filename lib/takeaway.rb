require "./lib/send_sms"
require "./lib/order"

class TakeAway
  def initialize(order=Order.new,menu=Menu.new,sms=Messenger.new)
    @order = order
    @menu = menu
    @sms = sms
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


  def place_order
    @order.total
    @sms.send
  end
end
