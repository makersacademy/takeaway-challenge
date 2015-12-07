class Twillio

  attr_reader :message

  def confirmation_text(display_order, sid = ENV["TWILIO_SID"], token = ENV["TWILIO_AUTH_TOKEN"], num = ENV["MY_TWILIO_NUMBER"])
    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = sid
    auth_token  = token
    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create(:body => "Hey! Thanks for choosing chuck's sub shop! You've ordered #{display_order} It will be delivered before #{Time.now + 10*60*60}",
        :to => ENV["MY_REAL_NUMBER"],     # Replace with your phone number
        :from => num)   # Replace with your Twilio number
    message.sid
  end

end
