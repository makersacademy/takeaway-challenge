require 'twilio-ruby'

class SMS
 attr_reader :time

def time 
    @time = Time.new + 60 * 60
end

  def send_text
    account_sid = 'INPUT YOUR OWN ACCOUNT_SID'
    auth_token = 'INPUT YOUR OWN AUTH_TOKEN'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = 'NUMBERBOUGHTFROMTWILIO' # Your Twilio number
    to = 'YOURMOBILENUMBER' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: "Your order will be delivered at #{@time}!"
      )
      "Text sent"
  end 
end
