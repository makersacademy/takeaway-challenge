require 'twilio-ruby'
require_relative "order"

class Confirmation

  def initialize
    account_sid = 'AC388d941b9fda6bd8669648cfe03dc9e0'
    auth_token = 'c80382e571d3b4415c7111a572bbbf96'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def message
    @client.messages.create(
    from: '+447403927326',
    to: '+447397510122',
    body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
  end

  def time
    @time = (Time.now + 3600).strftime("%H:%M")
  end


end
