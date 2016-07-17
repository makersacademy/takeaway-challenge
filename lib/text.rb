require 'twilio-ruby'
require './twilio_keys.rb'

class Text
  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def message
    time = Time.new
    hour = time.hour+1
    hour = 0 if hour == 24
    minute = time.min
    @client.account.messages.create(
      :from => MY_TWILIO_NUMBER,
      :to => NUMBER_TO_SEND,
      :body => "Thank you! Your order was placed and will be delivered before #{hour}:#{minute}"
    )
    "Sent message!"
  end
end
