require 'twilio-ruby'

  account_sid = "AC4652867e62a8ad85f253fcd1c96016ba" # Your Test Account SID from www.twilio.com/console/settings
  auth_token = "590379d91fe68d1e887e7dcf91354037"   # Your Test Auth Token from www.twilio.com/console/settings
  
  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Hello from Ruby",
      to: "+447447062441",    # Replace with your phone number
      from: "+15005550006")  # Use this Magic Number for creating SMS
  
  puts message.sid