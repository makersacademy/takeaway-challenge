require 'twilio-ruby'

class Text

  def send_sms
    account_sid = 'ACb72247efd4758c41dbdbdedf140fc3e7'
    auth_token = 'a393d90dc34b98d353b5642ccfdc4893'
    client = Twilio::REST::Client.new(account_sid, auth_token)
        
    from = '+441582214721' # Your Twilio number
    to = '+447825849151' # Your mobile phone number
        
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered in a week! (we're a bit slower than our competitors)"
    )
  end

end