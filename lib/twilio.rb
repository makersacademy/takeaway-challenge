require 'twilio-ruby'

class TwilioClient

  @@account_sid = 'AC88463ee026ff8a7840058e37c3de2f75'
  @@auth_token = '91fb91983f7204c8f2360747d5090823'
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  @@from = '+17163175655' # Your Twilio number

  def self.send_message
    to = '+44740******' # Your mobile phone number

    @@client.messages.create(
    from: @@from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

end
