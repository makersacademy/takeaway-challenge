require 'twilio-ruby'

class Messenger
  def initialize(client = Twilio::REST::Client)
    @client = client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
  end

  def send_message(total)
    @client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: ENV['TWILIO_DESTINATION_PHONE'],
      body: "Thank you for your order: £#{total}"
    )
  end
end
