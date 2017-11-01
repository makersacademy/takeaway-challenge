require 'twilio-ruby'

class Text
  def send_text(time)
    
    hour_later = ((Time.now)+60*60).strftime('%H:%M')
    
    account_sid = "***REMOVED***" # Your Account SID from www.twilio.com/console

    auth_token = "***REMOVED***"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you for you order! You will receive it no later than #{hour_later}.",
        to: "***REMOVED***",    # Replace with your phone number
        from: "***REMOVED***")  # Replace with your Twilio number

    message.sid
  end

end