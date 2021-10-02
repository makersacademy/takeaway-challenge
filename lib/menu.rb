require 'twilio-ruby'

# account_sid = "AC56a614c80c40b2d730f624b8f395bf10" # Your Test Account SID from www.twilio.com/console/settings
# auth_token = "b22114508794bdb02e7d2fe587e926c4"   # Your Test Auth Token from www.twilio.com/console/settings

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: delivery_message,
#     to: "+447947613279",    # Replace with your phone number
#     from: "+19384440993")  # Use this Magic Number for creating SMS

# puts message.sid


class Menu
  attr_reader :list, :order, :total, :delivery_message

# account_sid = "AC56a614c80c40b2d730f624b8f395bf10" # Your Test Account SID from www.twilio.com/console/settings
# auth_token = "b22114508794bdb02e7d2fe587e926c4"   # Your Test Auth Token from www.twilio.com/console/settings

# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.messages.create(
#     body: "test message",
#     to: "+447947613279",    # Replace with your phone number
#     from: "+19384440993")  # Use this Magic Number for creating SMS

# puts message.sid

  def initialize
    @list = {
      1 => "cod £5",
      2 => "fishcake £4",
      3 => "chips £3"
    }
    @order = []
    @delivery_message = "test"
  end

  def see_list
    @list
  end

  def place_order(*item)
    @order = @list.slice(*item)
    @total = @order.values.map{ |v| v.match(/\d/)[0].to_i}.sum
  end

  def verify_order
    "Your total is #{@total} for the following #{@order}"
  end

  def confirm_order
    t = Time.new
    hour_plus1 = ((t.strftime("%H").to_i) + 1)
    @delivery_message  = "Thank you! Your order was placed and will be delivered before #{t.strftime("at #{hour_plus1}:%M%p")}"
    account_sid = "AC56a614c80c40b2d730f624b8f395bf10" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "b22114508794bdb02e7d2fe587e926c4"   # Your Test Auth Token from www.twilio.com/console/settings
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.messages.create(
      body: @delivery_message,
      to: "+447947613279",    # Replace with your phone number
      from: "+19384440993")  # Use this Magic Number for creating SMS
  
  puts message.sid
  end
end

menu = Menu.new
menu.place_order(1, 2)
      menu.confirm_order