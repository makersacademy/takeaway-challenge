require 'twilio-ruby'
require '../.env.rb'

class Text

  attr_reader :sender, :client

  def initialize
    @sender = "441724411046"
    @client = Twilio::REST::Client.new(ENV[:account_sid], ENV[:auth_token])
  end

  def time
    delivery_time = (Time.new + 2700).strftime("%H:%M")
  end

  def send_text
    @client.account.messages.create(
    body: "Thank you for your order. It will be delivered before #{time}",
    to: ENV[:phone_number],
    from: sender)
  end
end
