require 'twilio-ruby'

class Messager
  
  def send_sms(message)
    
    twilio_send(message)
    message
   
  end
  
  private
  
  def twilio_send(message)
    
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    client.messages.create(
    from: ENV['FROM'],
    to:   ENV['TO'],
    body:  message
    )
    
  end
  
end