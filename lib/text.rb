require 'twilio-ruby'
class Text 

  
  def send_text
    account_sid = "AC27c508d75d73ae4073b862e04ac74d74" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "ed6bec170f914ed9fdb8bdc7159291f9"   # Your Test Auth Token from www.twilio.com/console/settings
  
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
      to: "+447946180718",    # Replace with your phone number
      from: "+44 7782 503067")  # Use this Magic Number for creating SMS
    message.sid
  end

 # private

  def delivery_time
    time = Time.now + 60 * 60
    time.strftime("%H:%M") 
  end
end
