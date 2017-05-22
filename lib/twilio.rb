require 'twilio-ruby'
require 'time'
require_relative 'token'



public



def send_message
  account_sid = Token::SID # Your Account SID from www.twilio.com/console
  auth_token = Token::TOKEN   # Your Auth Token from www.twilio.com/console

  $client = Twilio::REST::Client.new account_sid, auth_token

  message = $client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}\n",
      :to => Token::TO,    # Replace with your phone number
      :from => Token::FROM)  # Replace with your Twilio number

      puts message.sid
end
