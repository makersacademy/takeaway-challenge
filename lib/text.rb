require 'twilio-ruby'

class Text

  def send_text
    account_sid = "AC8f7b14e13ee141cc951b1541aef39797" # Your Account SID from www.twilio.com/console
    auth_token = "cde9bb8b92ee5117f995da6717cfd578" # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
    body: "Your order has been confirmed and will be with you #{delivery_time}",
    to: "+447538722462",    # Replace with your phone number
    from: "+441933790105")  # Replace with your Twilio number
    "Text sent"
  end
  
  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end
  
end
