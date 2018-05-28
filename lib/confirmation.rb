require 'twilio-ruby'

class Confirmation 

  def initialize
    account_sid = 'ACdffb9exxxx'
    auth_token = 'fd15ee9xxxx'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def sender
    from = '+441133205765' # Your Twilio number
  end 

  def receiver
    to = '+447412525804' # Your mobile phone number
  end

  def send_text_message(message)
    @client.messages.create(
    from: sender,
    to: receiver,
    body: message
    )
  end
end
