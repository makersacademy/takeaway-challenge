require 'dotenv'
Dotenv.load('var.env')

class Messenger

  def initialize(client = Twilio::REST::Client.new(ENV["account_sid"], ENV["auth_token"]))
    @client = client
  end

  def send_text(message)
    from = ENV["twilio_phone_number"]
    to = ENV["recipient_phone_number"]

    @client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
