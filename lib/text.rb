require 'twilio-ruby'

def send_text(message)

  @client = Twilio::REST::Client.new 
  
  @client.messages.create(
    from: "+441273917629",
    to: '',
    body: message
  )
  
end
