require 'twilio-ruby'

class TwilioClient

  @@account_sid = ENV['TWILIO_ACCOUNT_SID']
  @@auth_token = ENV['TWILIO_AUTH_TOKEN']
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  @@from = '+17163175655' # Your Twilio number

  def self.send_message(to_number)
    to = to_number # Your mobile phone number

    @@client.messages.create(
    from: @@from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

end
