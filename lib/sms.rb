require 'twilio-ruby'

class SMS
 attr_reader :time

def time 
    @time = Time.new + 60 * 60
end

  def send_text
    account_sid = 'AC457ee397e709fd037976be537414e690'
    auth_token = 'ed570919637a415ef168079c0c0cb201'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441355377036' # Your Twilio number
    to = '+447900612229' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: "Your order will be delivered at #{@time}!"
      )
      "Text sent"
  end 
end
