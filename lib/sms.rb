require 'twilio-ruby'
class SMS(client_class=Twilio::REST::Client)
  account_sid = "AC4652867e62a8ad85f253fcd1c96016ba" # Your Test Account SID from www.twilio.com/console/settings
  auth_token = "590379d91fe68d1e887e7dcf91354037"   # Your Test Auth Token from www.twilio.com/console/settings
  
  @client = client_class.new account_sid, auth_token
  
  def message 
    @client.messages.create(body: "Thank you! Your order was placed and will be delivered soon.", to: "+447447062441", from: "+15005550006")
  end
end