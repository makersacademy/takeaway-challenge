require 'rubygems'
require 'twilio-ruby'

class SMS
  def self.send_sms(message)
    account_sid = 'AC3be61d7acd49b02884834916c290f63e'
    auth_token = 'caf5ca083e1e578333956b9ea8b3b24f'
    client = Twilio::REST::Client.new account_sid, auth_token

    from = '+447533005208' # Your Twilio number
    to = '+447445367881' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
