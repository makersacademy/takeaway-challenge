require 'twilio-ruby'
require 'time'

class TextMessage

  def initialize(client = Twilio::REST::Client)
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from = ENV['TWILIO_NUMBER']
    @client = client.new(@account_sid, @auth_token)
  end

  def send_text_message(to)
    instance = @client
    instance.messages.create(
    from: @from,
    to: to,
    body: "Thank you! Your order has been placed and will be delivered before #{(Time.now + 1*60*60).strftime("%R")}"
    )
  end

end
