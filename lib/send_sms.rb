require 'twilio-ruby'

account_sid = "Account SID"
auth_token = "Auth tocken"   
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Your order is ready for collection",
    to: "My_number",    
    from: "Twilio phone number")  
puts message.si