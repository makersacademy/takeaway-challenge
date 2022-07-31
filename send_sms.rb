require_relative 'twilio-ruby'
class Text 
  def send_text
    account_sid = '*******'
    auth_token = '*******'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+************' # Your Twilio number

    to = '+*******' # Your mobile phone number

    to = '+*********' # Your mobile phone number


    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed 
    and will be delivered before #{(Time.new + 10*6*60)}"
    )
  end
end 

