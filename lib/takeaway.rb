require_relative 'menu'
require_relative 'keys'
require 'twilio-ruby'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = {})
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.dishes
  end

  def place_order(dish, quantity = 1)
    @order[dish] = quantity
    return "#{quantity}x #{dish}(s) added to your order"
  end

  def basket_summary
    summary = ""
    @order.each {
      |dish, quantity| summary << "#{dish} x#{quantity} = £#{menu.dishes[dish] * quantity}, "
    }
    summary.chop.chop
  end

  def total
    order_total = 0
    @order.each {
      |dish, quantity| order_total += menu.dishes[dish] * quantity
    }
    return "Total: £#{order_total}"
  end

  def send_message
    keys = Keys.new
    
    client = Twilio::REST::Client.new keys.account_sid, keys.auth_token

    time = (Time.now + 3600).strftime("%k:%M")

    client.messages.create(
      from: keys.host,
      to: keys.recipient,
      body: "Thank you! Your order will be delivered before #{time}"
    )
  end

  def checkout
    send_message
    return "Thanks for your order, you will receive SMS confirmation"
  end
end
