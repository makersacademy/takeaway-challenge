require 'twilio-ruby'
require("bundler")
require_relative 'order'
Bundler.require()

class SMS
  attr_reader :sms

  def initialize
    account_sid = ""
    auth_token = ""
    @client = Twilio::REST::Client.new account_sid, auth_token
    @recipient = ""
    @sender = ""
    time = Time.now + 1 * 60 * 60
    @text = "Thanks! Your order was placed and will be delivered before #{time.strftime("%H:%M")}"
  end

  def send_sms
    message = @client.messages.create(
        to: @recipient,
        from: @sender,
        body: @text)
    puts message.sid
  end

end
