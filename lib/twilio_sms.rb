require 'twilio-ruby'

class TwilioSMS

  def initialize(credentials)
    @twilio_client = set_client(credentials)
  end

  def send(from, to, body)
    
    message = @twilio_client.messages.create(
      body: body,
      to: to,
      from: from) 
       
    raise "Failed to send SMS" unless message.error_code.nil?
  end

  private

  def set_client(credentials)
    twilio_client = Twilio::REST::Client.new(credentials.account_id, credentials.auth_token)
  end

end
