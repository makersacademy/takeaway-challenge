# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

module Twilio

  def confirmation_text
    account_sid = 'AC7a878744bb39b67e2d737f117a29f955'
    auth_token = '4e00570b193c98eac97b0c17a45a0ff4'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441618506959' # Your Twilio number
    to = '+447805949437' # Your mobile phone number

    now = Time.now
    delivery_time = "#{ now.hour + 1 }:#{ now.min }"

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

end
