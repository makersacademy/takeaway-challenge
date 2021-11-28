require 'dotenv'
Dotenv.load('data.env')
require 'twilio-ruby'

class SMS
  def initialize(client: Twilio::REST::Client.new(ENV["TWILIO_SID"],ENV["TWILIO_AUTH_TOKEN"]))
    @client = client
  end

  def confirmation_text(message)
    @client.messages.create(
    from: '+447380309457',
    to: ENV["MY_NUMBER"],
    body: message)
  end
end