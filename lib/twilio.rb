require 'twilio-ruby'
require 'time'
require 'dotenv'
Dotenv.load



public



def send_message
  account_sid = ENV['TWILIO_SID'] # Your Account SID from www.twilio.com/console
  auth_token = ENV['TWILIO_TOKEN']   # Your Auth Token from www.twilio.com/console

  $client = Twilio::REST::Client.new account_sid, auth_token

  message = $client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}\n",
      :to => ENV['TWILIO_TO'],    # Replace with your phone number
      :from => ENV['TWILIO_FROM'])  # Replace with your Twilio number

      puts message.sid
end
