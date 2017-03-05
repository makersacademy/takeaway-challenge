require 'twilio-ruby'
require_relative 'takeaway'

class Messenger

  def send_message(message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['TWILIO_PHONE_NUMBER'],
      body: message
    )
  end
end
