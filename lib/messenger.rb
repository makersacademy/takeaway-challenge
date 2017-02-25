require 'twilio-ruby'

class MessengerService

  def send_SMS(message = "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%H:%M")}")
    account_sid = 'AC151290d57f0d80c9f6886bf405a84cca'
    auth_token = 'cb17e6b65aceaae13351315ceaab2a68'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: '+441730352017',
      to: '+447803309144',
      body: message
      )
  end

end
