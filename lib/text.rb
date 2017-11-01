require 'twilio-ruby'
require './auth_credentials'

class Text
  def send_text(total)
    
    hour_later = ((Time.now)+60*60).strftime('%H:%M')
    
    account_sid = ACCOUNT_SID # Your Account SID from www.twilio.com/console

    auth_token = AUTH_TOKEN   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Your order total is #{total} and you will receive it no later than #{hour_later}. Thank you!",
        to: TO,    # Replace with your phone number
        from: FROM)  # Replace with your Twilio number

    message.sid
  end

end