require 'twilio-ruby'
Dotenv.load

require_relative 'takeaway'
require_relative 'menu'

class Text

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send_text
    @client.account.messages.create(
    from: ENV['TWILIO_NUM']
    to: ENV['MY_NUM']
    body: delivery_confirmation(message)
    )
  end

  def delivery_confirmation(message)
    message = "Thanks! Your order has been placed!"
  end
end
