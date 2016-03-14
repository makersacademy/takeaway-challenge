require 'twilio-ruby'
require 'dotenv'

class Text

  attr_reader :twilio_creds
  
  def initialize
    @twilio_creds = Dotenv.load
  end

  def send_confirmation(message)
    confirmation_text(message)
  end

  private

  def confirmation_text(message)
    account_sid = @twilio_creds['account_sid']
    auth_token  = @twilio_creds['auth_token']
    sender      = @twilio_creds['twilio_num']
    receiver    = @twilio_creds['my_num']

  @client = Twilio::REST::Client.new  account_sid, auth_token

  @message = @client.messages.create(
    to:   receiver,
    from: sender,
    body: message
  )
  end

end
