require 'twilio-ruby'

class MessengerService

  def initialize(sid = 'AC151290d57f0d80c9f6886bf405a84cca', token = 'cb17e6b65aceaae13351315ceaab2a68')
    @sid = sid
    @token = token
  end

  def send_SMS(from = '+441730352017', to = '+447803309144', message = "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%H:%M")}")
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new @sid, @token

    @client.account.messages.create(
      from: from,
      to: to,
      body: message
      )
  end

end
