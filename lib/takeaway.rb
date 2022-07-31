require 'twilio-ruby'

account_sid = 'sid'
auth_token = 'token'
@client = Twilio::REST::Client.new api_key_sid, api_key_secret, account_sid

class Takeaway

  attr_reader :MENU, :order
  MENU = { "brocolli" => 3, "risotto" => 10, "bread" => 5 }

  def initialize
    @order = []
    @menu = MENU
    @order_total = 0
  end

  def read_menu
    MENU
  end

  def select(pick)
    @order << MENU.select { |key| key == pick }
  end

  def total
    @order.each { |selection|
      selection.each_value { |value| @order_total += value }
    }
    p @order_total
  end

  def check_total
    total
    "Your order was #{@order}. Your total was #{@order_total}."
  end

  @client.messages.create(
  from: phone_number,
  to: user_number,
  body: 'Thank you! Your order was placed and will be delivered before '
)
end
