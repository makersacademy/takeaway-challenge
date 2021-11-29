def send_text(message)
  account_sid = 'AC4bce300a46726464d43d6ef4c4051cf5' 
  auth_token = ENV['AuthToken'] 
  @client = Twilio::REST::Client.new(account_sid, auth_token) 

  message = @client.messages.create(   
    body: message,
    messaging_service_sid: 'MGc6ed9a1f11afc694b64b2ce6341d0019',      
    to: ENV['SECRET_NUMBER'] 
  ) 

  puts message.sid
end