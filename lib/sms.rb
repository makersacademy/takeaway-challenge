require 'twilio-ruby'
require 'dotenv'
Dotenv.load

require_relative 'takeaway'
require_relative 'menu'

class Text

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTHO_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text
    @client.account.messages.create(
    from: ENV['TWILIO_NUM'],
    to: ENV['MY_NUM'],
    body: confirm_delivery
    )
  end

  def confirm_delivery
    "Thanks! Your order has been placed! It will arrive at #{time}"
  end

  def time
    Time.now
  end
end
