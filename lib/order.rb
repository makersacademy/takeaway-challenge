require 'twilio-ruby'
require 'sms_sender'
require 'menu'

class Order
  attr_reader :menu, :order, :total, :delivery_message

  def initialize(sms_sender: sms_sender = SmsSender.new, menu: menu = Menu.new)
    @list = {
      1 => "cod £5",
      2 => "fishcake £4",
      3 => "chips £3"
    }
    @menu = menu.list
    @order = []
    @sms_sender = sms_sender
  end

  def see_menu
    @menu
  end

  def place_order(*item)
    @order = @menu.slice(*item)
    @total = @order.values.map { |v| v.match(/\d/)[0].to_i }.sum
  end

  def verify_order
    p "Your total is £#{@total} for the following #{@order}"
  end

  def confirm_order
    @delivery_message = "Thank you! Your order was placed and will be delivered before #{time_plus_1hour}"
    @sms_sender.send_text(@delivery_message)
  end

  private

  def time_plus_1hour
    t = Time.new
    hour_plus1 = ((t.strftime("%H").to_i) + 1)
    t.strftime("at #{hour_plus1}:%M%p")
  end

end
