# messaging class
require 'twilio-ruby'
require 'date'
class MessageProcessor

  def send_message
    account_sid = 'AC054b2e6d3d275987becb653d8a3ed5f4'
    auth_token = '8581d5d33619c11370fb1ffd759c27d9'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441472730326' # Your Twilio number
    to = '+447807795722' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Your order has been delivered and will arrive at #{11} : #{30}"
    )
  end

end
