require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text
  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def message
    time = Time.new
    hour = time.hour+1
    hour = 0 if hour == 24
    minute = time.min
    @client.account.messages.create(
      :from => ENV['MY_TWILIO_NUMBER'],
      :to => ENV['NUMBER_TO_SEND'],
      :body => "Thank you! Your order was placed and will be delivered before #{hour}:#{minute}"
    )
    "Sent message!"
  end
end
