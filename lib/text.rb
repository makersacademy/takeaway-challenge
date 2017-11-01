require 'twilio-ruby'

class Text
  def send_text(time)
    
    hour_later = ((Time.now)+60*60).strftime('%H:%M')
    
    account_sid = "AC6a68018d2d6c644836f15d801784241c" # Your Account SID from www.twilio.com/console

    auth_token = "3ceb2b533e9194126240a44ff08cbea4"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you for you order! You will receive it no later than #{hour_later}.",
        to: "+447931737379",    # Replace with your phone number
        from: "+447481337808")  # Replace with your Twilio number

    message.sid
  end

end