
require_relative "take_away.rb"



  def send_sms(order_has_been_placed)
    account_sid = "ACf9df928268c457772d4b2608064c2f08" # Your Account SID from www.twilio.com/console
    auth_token = "4e8418b983ae9fbb6e54bc78209ae0f1"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => order_has_been_placed,
        :to => "+491632016879",    # Replace with your phone number
        :from => "+4915735985975")  # Replace with your Twilio number
  end
