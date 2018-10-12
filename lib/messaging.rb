require 'twilio-ruby'


CONF = {
  account_sid: ENV['TWILIO_ACCOUNT_SID'],
  auth_token: ENV['TWILIO_AUTH_TOKEN'],
  # client = Twilio::REST::Client.new(account_sid, auth_token)

  from: ENV['TWILIO_FROM_NUMBER'], # Your Twilio number
  to: ENV['TWILIO_TO_NUMBER'] # Your mobile phone number
}
# client.messages.create(
# from: from,
# to: to,
# body: "Hey friend!"
# )

class Messaging
  def initialize
    p "m"
  end

  def message
    "Thank you!"
  end

  def send_message(message_text)

    # account_sid = ENV['TWILIO_ACCOUNT_SID']
    # auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(CONF[:account_sid], CONF[:auth_token])

    # from = ENV['TWILIO_FROM_NUMBER'] # Your Twilio number
    # to = ENV['TWILIO_TO_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: CONF[:from],
    to: CONF[:to],
    body: message_text
  )
  end
end
