require 'twilio-ruby'

class Text

  def send_text_confirmation
account_sid = "ACfb268cf63feb07850d477e2d09d51991" # Your Account SID from www.twilio.com/console
auth_token = "9da6beae3b6a3f06984c43454811a0ae"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60 * 60)).strftime("%H:%M")}",
    :to => "+447791242233",    # Replace with your phone number
    :from => "+441395642026")  # Replace with your Twilio number

puts message.sid
  end

end
