class Takeout
  require 'twilio-ruby'

  attr_accessor :order, :menu

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def add_to_menu(items_hash)
    items_hash.each { |k, v| menu[k] = v }
  end

  def price
    order.reduce(0) { |sum, (item, value)| sum + (value * menu[item]) }
  end

  def confirm_order(number, message, change)
    text(message, change, number)
  end

  private

  def text(time, change, number)
    account_sid = "AC2e1ac993aca31d47424ddfde7fcf6003"
    auth_token = "99b34c4e6c084558d8d4971002ec2415"
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441288255120' # Your Twilio number
    to = number # Your mobile phone number
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time}! Here is your change: £#{change}"
  )
  end

end
