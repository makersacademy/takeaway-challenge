require 'twilio-ruby'

class Text
  def initialize
    account_sid = 'ACa353025d1bc42a06b259ff9332279f8d'
    auth_token = '30e174a43e758ef20e98c283551427e0'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '(224) 269-8631' # Your Twilio number
    to = ENV['API_KEY'] # Your mobile phone number
    #i know this is not correct
  end

  def send
    client.messages.create(
    from: from,
    to: to,
    body: "Your order has been accepted and will be with you soon!"
    )
  end
end
