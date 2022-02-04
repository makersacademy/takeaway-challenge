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

  def receive_sms
    messages = @twilio_client.messages.list(limit: 20)

  end

end

def this_changed_my_Slack_life 
  puts "Wow, this is so cool"
end