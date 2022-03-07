require 'twilio-ruby'

class TwilioClient

  @@account_sid = ENV['TWILIO_ACCOUNT_SID']
  @@auth_token = ENV['TWILIO_AUTH_TOKEN']
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  @@from = '+17163175655' # Your Twilio number

  def self.send_message(to_number)
    to = to_number # Your mobile phone number
    t = Time.now

    @@client.messages.create(
    from: @@from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{t.hour+1}:#{t.min}"
    )
  end

end
