require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Message

  def send
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH']
    @client.account.messages.create(
      from: ENV['FROM_PHONE'],
      to: ENV['TO_PHONE'],
      body: "Thanks for your order; it's on the way"
      )
  end

end