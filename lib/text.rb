require 'order'
require 'twilio-ruby'

class Text
  def initialize(input)
    @input = input
  end

  account_sid = "AC2e1ac993aca31d47424ddfde7fcf6003"
  auth_token = "99b34c4e6c084558d8d4971002ec2415"
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+441288255120' # Your Twilio number
  to = '+447484356594' # Your mobile phone number
  @client.messages.create(
  from: from,
  to: to,
  body: "delivery at #{input}!"
  )

end
