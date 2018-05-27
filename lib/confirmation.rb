require 'twilio-ruby'

class Confirmation 

  def initialize
    account_sid = 'ACdffb9edd5111340d41549cb5fdf96bc0'
    auth_token = 'fd15ee99cd14a6d6a896f63b441ff7c1'
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