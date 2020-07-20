require 'twilio-ruby'
require_relative 'twilio_ids'

class Text
  def initialize(twilio = Ids.new)
    @twilio = twilio
    @client = Twilio::REST::Client.new(@twilio.account_sid, @twilio.auth_token)
  end
  def send_confirmation(number)
    from = @twilio.mynumber
    to = number
    @client.messages.create(
     from: from,
     to: to,
     body: "Your order was placed and will be delivred before #{Time.now + (60*60)}."
    )
  end
end