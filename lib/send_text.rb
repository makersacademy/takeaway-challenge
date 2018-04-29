require 'twilio-ruby'
class Mobile
  def send_text
    account_sid = "AC02064d4bed00e8b8410c04d092d582dc" 
    auth_token = "1e29ea8fb72d11b4ec9d50033443ae81"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Your order will be there at #{(1 + Time.new.hour)}:
                  #{Time.new.min}",
        to: "++447756355816", # Replace with your phone number
        from: "+441628200729") # Replace with your Twilio number

    puts message.sid
  end
end
