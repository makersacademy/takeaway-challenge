require 'twilio-ruby'
require 'time'

account_sid = "ACa6ff088791be16d17e306fbf40ff1d2f" # Your Account SID from www.twilio.com/console
auth_token = "0ad07a4a4b82f0f837c102ffba6e1640"   # Your Auth Token from www.twilio.com/console

public

$client = Twilio::REST::Client.new account_sid, auth_token

def send_message
  message = $client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}\n",
      :to => "+447407080048",    # Replace with your phone number
      :from => "+441993402098")  # Replace with your Twilio number

      puts message.sid
end
