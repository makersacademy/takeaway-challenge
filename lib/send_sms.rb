class Twillio

  def confirmation_text(display_order)
    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = 'AC09c3f33609c1212163f034b3b06d8bab'
    auth_token  = '3a16956dbda9c2074cbcba205fc514bb'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "Hey! Thanks for choosing chuck's sub shop! You've ordered #{display_order} It will be delivered before #{Time.now + 10*60*60}",
        :to => "+4407340207478",     # Replace with your phone number
        :from => "+441212854805")   # Replace with your Twilio number
    puts message.sid
  end

end
