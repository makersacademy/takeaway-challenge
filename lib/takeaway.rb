require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu, :order

def initialize
  @menu = Menu.new
  @order = Order.new
end

def print_menu
  @menu.menu
end

def add_item(item, quantity)
  @order.add(item, quantity)
end

def view_order
  @order.order_summary
  @order.basket_total
end

def confirm_order
  @message.send_message
  end
end

# private
#
# def send_message
#   time = Time.now + 1 * 60 * 60
#   account_sid = 'AC235481255507c7e22cbe41b1512dd666'
#   auth_token = '4e9c8ca3dac137e2ca52b7280e1ed671'
#
#   client = Twilio::REST::Client.new(account_sid, auth_token)
#
#   from = '+441829470020' # Twilio num
#   to = '+447786356423' # Mob Num
#
#  client.messages.create(
#    from: from,
#    to: to,
#    body: "Thank you! Your order has been placed and will be delivered by #{time.hour} :#{time.min}."
#   )
#   "Text sent"
#   end
# end
