require 'Time'
require 'twilio-ruby'

class TextConfirm

  def initialize(account_sid = ENV['TWILIO_ACCOUNT_SID'], auth_token = ENV['TWILIO_AUTH_TOKEN'], from = ENV['TWILIO_NUMBER'])
    @account_sid = account_sid
    @auth_token = auth_token
    @from = from
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send
    @time = (Time.now + 60 * 60).strftime("%H:%M")
    message = @client.messages.create(
      from: @from,
      to: ENV['PHONE'],
      body: "Thank you! Your order was placed and will be delivered before #{@time}"
    )
    message.body
  end

end
