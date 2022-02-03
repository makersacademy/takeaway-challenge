require 'twilio-ruby'

class TwilioSMS

  def initialize(twilio_client) 
    @twilio_client = twilio_client
  end

  def send_sms(from, to, body)

    message = @twilio_client.messages.create(
      body: body,
      to: to,
      from: from) 
       
    raise "Failed to send SMS" unless message.error_code.nil?
  end

end
