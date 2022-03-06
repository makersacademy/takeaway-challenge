require 'twilio-ruby'


class TwilioClient

  @@account_sid = 'AC88463ee026ff8a7840058e37c3de2f75'
  @@auth_token = '4b3c00a5a50ed5aee83ea3dcf893e3c8'
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
