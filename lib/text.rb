require 'twilio-ruby'

def send_text(message)

  @client = Twilio::REST::Client.new 'ACcfe12bfc3a16eac82da99718c4016fcb', '4f57e5dc9dac1bccec5cd0b197b92324'
  
  @client.messages.create(
    from: "+441273917629",
    to: '+447958006866',
    body: message
  )
  
end
